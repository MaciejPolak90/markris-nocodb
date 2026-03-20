const http = require('http');
const fs = require('fs');
const path = require('path');

const TOKEN = 'oemr4pTEByLHqpTQDyyqG6K6CYPbeBApATFjEUZb';
const PROJECT_ID = 'pupuc6ugup9dm03';
const OUTDIR = path.join(__dirname, 'csv-export');

const tables = [
  { id: 'mleo2f440ply95o', name: '1_CLIENTS' },
  { id: 'm9wa466xf8r4x94', name: '2_CONTACTS' },
  { id: 'm0nr5nzv9kw4ap2', name: '3_VEHICLES' },
  { id: 'milkom888hl5xrj', name: '4_DRIVERS' },
  { id: 'mzwj8ptf78t4pi9', name: '5_INQUIRIES' },
  { id: 'mko9nvxci0pz4dd', name: '6_TRANSPORTS' },
  { id: 'mizgezntumu0w42', name: '7_FREIGHTS' },
];

function fetch(url) {
  return new Promise((resolve, reject) => {
    http.get(url, { headers: { 'xc-token': TOKEN } }, (res) => {
      let data = '';
      res.on('data', (c) => (data += c));
      res.on('end', () => resolve(JSON.parse(data)));
    }).on('error', reject);
  });
}

function escapeCsv(v) {
  if (v === null || v === undefined) return '';
  const s = String(v);
  if (s.includes(',') || s.includes('"') || s.includes('\n'))
    return '"' + s.replace(/"/g, '""') + '"';
  return s;
}

async function exportTable(table) {
  let allRows = [];
  let offset = 0;
  const limit = 1000;

  while (true) {
    const url = `http://localhost:8080/api/v1/db/data/noco/${PROJECT_ID}/${table.id}?limit=${limit}&offset=${offset}`;
    const data = await fetch(url);
    if (!data.list || data.list.length === 0) break;
    allRows = allRows.concat(data.list);
    if (data.list.length < limit) break;
    offset += limit;
  }

  if (allRows.length === 0) {
    console.log(`  ${table.name}: PUSTA TABELA`);
    return;
  }

  const skip = new Set(['Id', 'CreatedAt', 'UpdatedAt', 'nc_order']);
  const keys = Object.keys(allRows[0]).filter(
    (k) => !skip.has(k) && !k.startsWith('nc_')
  );

  const lines = [keys.join(',')];
  for (const row of allRows) {
    lines.push(keys.map((k) => escapeCsv(row[k])).join(','));
  }

  const filePath = path.join(OUTDIR, table.name + '.csv');
  fs.writeFileSync(filePath, lines.join('\n'), 'utf8');
  console.log(`  ${table.name}: ${allRows.length} wierszy -> ${filePath}`);
}

async function main() {
  if (!fs.existsSync(OUTDIR)) fs.mkdirSync(OUTDIR, { recursive: true });

  console.log('Eksport tabel z projektu Markris_de...\n');
  for (const table of tables) {
    await exportTable(table);
  }
  console.log('\nGotowe!');
}

main().catch(console.error);
