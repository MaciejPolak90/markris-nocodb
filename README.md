# Markris CRM — NocoDB

System CRM dla firmy transportowej oparty na NocoDB (self-hosted) z bazą PostgreSQL.

## Wymagania

- Docker Desktop
- Git

## Uruchomienie

1. Sklonuj repozytorium:
   ```bash
   git clone <url-repo>
   cd markris-nocodb
   ```

2. Skopiuj plik `.env.example` lub utwórz `.env` z własnymi wartościami:
   ```
   POSTGRES_DB=nocodb
   POSTGRES_USER=nocodb
   POSTGRES_PASSWORD=<silne_haslo>
   NC_DB=pg://db:5432?u=nocodb&p=<silne_haslo>&d=nocodb
   NC_AUTH_JWT_SECRET=<losowy_secret>
   NC_PUBLIC_URL=http://localhost:8080
   ```
   **Haslo w `POSTGRES_PASSWORD` i w `NC_DB` (parametr `p=`) musi byc identyczne.**

3. Uruchom kontenery:
   ```bash
   docker-compose up -d
   ```

4. Otworz w przegladarce: **http://localhost:8080**

5. Przy pierwszym uruchomieniu NocoDB poprosi o utworzenie konta admina.

## Struktura tabel (do utworzenia w NocoDB)

Po zalogowaniu utwórz baze i nastepujace tabele:

### CLIENTS
| Pole | Typ |
|------|-----|
| Company Name | SingleLineText |
| VAT ID | SingleLineText |
| Address | LongText |
| Email | Email |
| Phone | PhoneNumber |
| Notes | LongText |

### CONTACTS
| Pole | Typ |
|------|-----|
| Full Name | SingleLineText |
| Position | SingleLineText |
| Email | Email |
| Phone | PhoneNumber |
| Client | Link to CLIENTS |
| Primary Contact? | Checkbox |

### VEHICLES
| Pole | Typ |
|------|-----|
| Registration Number | SingleLineText |
| Body Type | SingleLineText |
| Capacity kg | Number |
| Capacity m3 | Number |
| Pallet Spaces | Number |
| ADR? | Checkbox |
| ADR Classes | SingleLineText |
| Inspection Date | Date |
| Insurance Expiry | Date |
| Notes | LongText |

### DRIVERS
| Pole | Typ |
|------|-----|
| Full Name | SingleLineText |
| Phone | PhoneNumber |
| License Categories | SingleLineText |
| ADR? | Checkbox |
| ADR Classes | SingleLineText |
| ADR Expiry Date | Date |
| Medical Exam Expiry | Date |
| Vehicle | Link to VEHICLES |
| Notes | LongText |

### INQUIRIES
| Pole | Typ |
|------|-----|
| Inquiry Date | Date |
| Client | Link to CLIENTS |
| Contact | Link to CONTACTS |
| Origin City/Postal | SingleLineText |
| Destination City/Postal | SingleLineText |
| Loading Date | Date |
| Delivery Date | Date |
| Cargo Type | SingleLineText |
| ADR? | Checkbox |
| ADR Class/UN | SingleLineText |
| Dimensions | SingleLineText |
| Weight kg | Number |
| Status | SingleSelect: New, Quoted, Accepted, Rejected |
| Source | SingleSelect: Web Form, Phone, Email, Other |
| UTM Source | SingleLineText |
| Notes | LongText |

### TRANSPORTS
| Pole | Typ |
|------|-----|
| Departure Date | Date |
| Origin | SingleLineText |
| Destination | SingleLineText |
| Vehicle | Link to VEHICLES |
| Driver | Link to DRIVERS |
| Status | SingleSelect: Planned, In Progress, Completed |
| Notes | LongText |

### FREIGHTS
| Pole | Typ |
|------|-----|
| Client | Link to CLIENTS |
| Transport | Link to TRANSPORTS |
| Unit Type | SingleSelect: Pallet, Box, ADR, Other |
| Quantity | Number |
| Cargo Description | LongText |
| Pickup Address | SingleLineText |
| Delivery Address | SingleLineText |
| Transport Capacity % | Number |
| Freight Price EUR | Currency |
| Invoiced? | Checkbox |
| Invoice Number | SingleLineText |
| Notes | LongText |

### Relacje
- CONTACTS -> CLIENTS (wiele kontaktow do jednej firmy)
- DRIVERS -> VEHICLES (kierowca przypisany do pojazdu)
- INQUIRIES -> CLIENTS, CONTACTS
- TRANSPORTS -> VEHICLES, DRIVERS
- FREIGHTS -> CLIENTS, TRANSPORTS

## Przydatne komendy

```bash
# Zatrzymanie
docker-compose down

# Logi NocoDB
docker-compose logs -f nocodb

# Logi PostgreSQL
docker-compose logs -f db

# Reset (usuwa dane!)
docker-compose down -v
```
