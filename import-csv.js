const http = require('http');
const fs = require('fs');
const path = require('path');

const TOKEN = 'TX3XGzdhOzSZjRvNU2GxbDY2dntzZ26xYd9uNwdG';
const BASE_ID = 'pym1u669klwaaao';
const HOST = '152.53.134.8';
const PORT = 8080;
const CSV_DIR = path.join(__dirname, 'csv-export');

const tables = [
  '1_CLIENTS',
  '2_CONTACTS',
  '3_VEHICLES',
  '4_DRIVERS',
  '5_INQUIRIES',
  '6_TRANSPORTS',
  '7_FREIGHTS',
];

// Skip relation/lookup/m2m columns
function isDataColumn(col) {
  if (col.startsWith('_nc_m2m_')) return false;
  if (col.match(/\(from .+\)$/)) return false;
  // Skip link columns (references to other tables like "2_CONTACTs", "5_INQUIRIES1", etc.)
  if (col.match(/^\d_[A-Z]+s\s?\d?$/)) return false;
  if (col.match(/^\d_[A-Z]+s$/i)) return false;
  return true;
}

function parseCsv(text) {
  const rows = [];
  let current = '';
  let inQuotes = false;
  const lines = [];

  for (let i = 0; i < text.length; i++) {
    const ch = text[i];
    if (ch === '"') {
      if (inQuotes && text[i + 1] === '"') {
        current += '"';
        i++;
      } else {
        inQuotes = !inQuotes;
      }
    } else if (ch === ',' && !inQuotes) {
      rows.push(current);
      current = '';
    } else if ((ch === '\n' || ch === '\r') && !inQuotes) {
      if (ch === '\r' && text[i + 1] === '\n') i++;
      rows.push(current);
      current = '';
      if (rows.length > 0) lines.push([...rows]);
      rows.length = 0;
    } else {
      current += ch;
    }
  }
  if (current || rows.length > 0) {
    rows.push(current);
    lines.push([...rows]);
  }
  return lines;
}

function apiRequest(method, apiPath, body) {
  return new Promise((resolve, reject) => {
    const options = {
      hostname: HOST,
      port: PORT,
      path: apiPath,
      method,
      headers: {
        'xc-token': TOKEN,
        'Content-Type': 'application/json',
      },
    };

    const req = http.request(options, (res) => {
      let data = '';
      res.on('data', (c) => (data += c));
      res.on('end', () => {
        try {
          resolve(JSON.parse(data));
        } catch (e) {
          resolve(data);
        }
      });
    });
    req.on('error', reject);
    if (body) req.write(JSON.stringify(body));
    req.end();
  });
}

// Guess NocoDB column type from values
function guessType(name, values) {
  const lower = name.toLowerCase();
  if (lower.includes('email')) return 'Email';
  if (lower.includes('phone')) return 'PhoneNumber';
  if (lower.includes('date') || lower.includes('expiry')) return 'SingleLineText';
  if (lower.includes('price') || lower.includes('eur')) return 'Decimal';
  if (lower === 'invoiced' || lower === 'adr' || lower === 'primary contact') return 'Checkbox';
  if (lower.includes('notes')) return 'LongText';
  if (lower.includes('kg') || lower.includes('m3') || lower.includes('spaces') || lower.includes('quantity') || lower.includes('percent') || lower.includes('pallets')) return 'Decimal';
  if (lower.includes('status') || lower.includes('source') || lower.includes('body type') || lower.includes('unit type') || lower.includes('license categories')) return 'SingleLineText';
  return 'SingleLineText';
}

async function importTable(tableName) {
  const csvPath = path.join(CSV_DIR, tableName + '.csv');
  const text = fs.readFileSync(csvPath, 'utf8');
  const lines = parseCsv(text);

  if (lines.length < 2) {
    console.log(`  ${tableName}: PUSTA TABELA, pomijam`);
    return;
  }

  const allHeaders = lines[0];
  // Find data column indices
  const dataIndices = [];
  const dataHeaders = [];
  for (let i = 0; i < allHeaders.length; i++) {
    if (isDataColumn(allHeaders[i])) {
      dataIndices.push(i);
      dataHeaders.push(allHeaders[i]);
    } else {
      console.log(`    pomijam kolumnę relacji: ${allHeaders[i]}`);
    }
  }

  // Create table with first column
  console.log(`  Tworzę tabelę: ${tableName} (${dataHeaders.length} kolumn)...`);
  const createBody = {
    table_name: tableName,
    title: tableName,
    columns: dataHeaders.map((h) => ({
      title: h,
      column_name: h,
      uidt: guessType(h, []),
    })),
  };

  const tableResult = await apiRequest(
    'POST',
    `/api/v1/db/meta/projects/${BASE_ID}/tables`,
    createBody
  );

  if (tableResult.msg || tableResult.error) {
    console.log(`  BŁĄD tworzenia tabeli ${tableName}:`, tableResult.msg || tableResult.error);
    return;
  }

  const tableId = tableResult.id;
  console.log(`  Tabela utworzona: ${tableId}`);

  // Prepare rows
  const rows = [];
  for (let i = 1; i < lines.length; i++) {
    const row = {};
    for (let j = 0; j < dataIndices.length; j++) {
      const val = lines[i][dataIndices[j]];
      if (val !== undefined && val !== '') {
        row[dataHeaders[j]] = val;
      }
    }
    if (Object.keys(row).length > 0) rows.push(row);
  }

  // Bulk insert
  if (rows.length > 0) {
    const insertResult = await apiRequest(
      'POST',
      `/api/v1/db/data/bulk/noco/${BASE_ID}/${tableId}`,
      rows
    );
    if (Array.isArray(insertResult)) {
      console.log(`  Wstawiono ${insertResult.length} wierszy`);
    } else {
      console.log(`  Wynik insertu:`, JSON.stringify(insertResult).slice(0, 200));
    }
  }
}

async function main() {
  console.log('Import CSV do markristransporte na 152.53.134.8:8080\n');

  for (const table of tables) {
    await importTable(table);
    console.log('');
  }

  console.log('GOTOWE!');
}

main().catch(console.error);
