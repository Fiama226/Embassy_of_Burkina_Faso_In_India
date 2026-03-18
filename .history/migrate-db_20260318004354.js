// migrate-db.js
// Migrates data from old SQLite database to new one
// Usage: node migrate-db.js

import { Database } from 'better-sqlite3';
import { fileURLToPath } from 'url';
import path from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const OLD_DB = path.join(__dirname, 'backup-25-02-2025-a-12h16.db');
const NEW_DB = path.join(__dirname, 'database_new.db');

console.log('📦 Starting database migration...\n');
console.log(`Old DB: ${OLD_DB}`);
console.log(`New DB: ${NEW_DB}\n`);

try {
  const oldDb = new Database(OLD_DB, { readonly: true });
  const newDb = new Database(NEW_DB);

  // Enable foreign keys
  newDb.pragma('foreign_keys = ON');

  // Get all tables from old database
  const tables = oldDb.prepare(`
    SELECT name FROM sqlite_master 
    WHERE type='table' AND name NOT LIKE 'sqlite_%'
  `).all();

  console.log('📋 Found tables:', tables.map(t => t.name).join(', '), '\n');

  // Migrate each table
  for (const table of tables) {
    const tableName = table.name;
    console.log(`📊 Migrating table: ${tableName}...`);

    // Get table schema
    const schema = oldDb.prepare(`PRAGMA table_info(${tableName})`).all();
    const columns = schema.map(col => `"${col.name}"`).join(', ');
    
    // Get all rows from old DB
    const rows = oldDb.prepare(`SELECT * FROM ${tableName}`).all();
    
    if (rows.length === 0) {
      console.log(`   ⚪ Skipped (empty table)`);
      continue;
    }

    // Insert into new DB
    const insertStmt = newDb.prepare(`INSERT OR REPLACE INTO ${tableName} (${columns}) VALUES (${schema.map(() => '?').join(', ')})`);
    
    newDb.transaction(() => {
      for (const row of rows) {
        const values = schema.map(col => row[col.name]);
        insertStmt.run(...values);
      }
    })();

    console.log(`   ✅ Migrated ${rows.length} row(s)`);
  }

  oldDb.close();
  newDb.close();

  console.log('\n✅ Migration completed successfully!\n');
  console.log('⚠️  Next steps:');
  console.log('   1. Test the new database by starting the dev server');
  console.log('   2. If everything works, update payload.config.ts to use "database_new.db" as your main database');
  console.log('   3. Or rename: database.db → database_old.db, database_new.db → database.db\n');

} catch (error) {
  console.error('❌ Migration failed:', error.message);
  process.exit(1);
}
