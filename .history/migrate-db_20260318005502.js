// migrate-db.js
// Migrates data from old SQLite database to new one
// Usage: node migrate-db.js
//
// IMPORTANT: First run the dev server once to create the new DB schema,
// then run this script to migrate data.

import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const Database = require('better-sqlite3');
import { fileURLToPath } from 'url';
import path from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const OLD_DB = path.join(__dirname, 'backup-25-02-2025-a-12h16.db');
const NEW_DB = path.join(__dirname, 'database_new.db');

// Tables that have foreign keys - must be migrated AFTER their parent tables
const TABLE_ORDER = [
  // Parent tables first (no foreign keys)
  'users',
  'media',
  'media_locales',
  'categories',
  'categories_locales',
  'tags',
  'tags_locales',
  'actualites_carousel',
  'actualites_carousel_locales',
  'actualites',
  'actualites_locales',
  '_actualites_v_version_carousel',
  '_actualites_v_version_carousel_locales',
  '_actualites_v',
  '_actualites_v_locales',
  // Tables with foreign keys last
  'actualites_rels',
  '_actualites_v_rels',
  'users_sessions',  // Has FK to users
];

console.log('📦 Starting database migration...\n');
console.log(`Old DB: ${OLD_DB}`);
console.log(`New DB: ${NEW_DB}\n`);

// Check if new DB exists
const fs = require('fs');
if (!fs.existsSync(NEW_DB)) {
  console.log('❌ New database does not exist yet!');
  console.log('\n⚠️  Steps to create it:');
  console.log('   1. Make sure payload.config.ts points to "database_new.db"');
  console.log('   2. Run: npm run dev');
  console.log('   3. Wait for "Payload Admin UI ready" message');
  console.log('   4. Stop the dev server (Ctrl+C)');
  console.log('   5. Run this script again: node migrate-db.js\n');
  process.exit(1);
}

try {
  const oldDb = new Database(OLD_DB, { readonly: true });
  const newDb = new Database(NEW_DB);

  // Disable foreign keys during migration
  newDb.pragma('foreign_keys = OFF');

  // Get all tables from old database (exclude sqlite internal and payload meta tables)
  const oldTables = oldDb.prepare(`
    SELECT name FROM sqlite_master 
    WHERE type='table' AND name NOT LIKE 'sqlite_%' AND name NOT LIKE 'payload_%'
  `).all().map(t => t.name);

  console.log('📋 Found tables to migrate:', oldTables.join(', '), '\n');

  // Migrate tables in order
  let migratedCount = 0;
  for (const tableName of TABLE_ORDER) {
    if (!oldTables.includes(tableName)) {
      continue; // Skip if table doesn't exist in old DB
    }

    console.log(`📊 Migrating table: ${tableName}...`);

    // Check if table exists in new DB
    const tableExists = newDb.prepare(`
      SELECT name FROM sqlite_master 
      WHERE type='table' AND name=?
    `).get(tableName);

    if (!tableExists) {
      console.log(`   ⚪ Skipped (table doesn't exist in new DB)`);
      continue;
    }

    // Get table schema from old DB
    const schema = oldDb.prepare(`PRAGMA table_info(${tableName})`).all();
    const columns = schema.map(col => `"${col.name}"`).join(', ');
    
    // Get all rows from old DB
    const rows = oldDb.prepare(`SELECT * FROM ${tableName}`).all();
    
    if (rows.length === 0) {
      console.log(`   ⚪ Skipped (empty table)`);
      continue;
    }

    // Insert into new DB (skip if same id exists)
    const insertStmt = newDb.prepare(`INSERT OR IGNORE INTO ${tableName} (${columns}) VALUES (${schema.map(() => '?').join(', ')})`);
    
    let inserted = 0;
    newDb.transaction(() => {
      for (const row of rows) {
        const values = schema.map(col => row[col.name]);
        const result = insertStmt.run(...values);
        if (result.changes > 0) inserted++;
      }
    })();

    console.log(`   ✅ Migrated ${inserted}/${rows.length} row(s)`);
    migratedCount += inserted;
  }

  // Also migrate any tables not in our order list
  for (const tableName of oldTables) {
    if (TABLE_ORDER.includes(tableName)) continue; // Already migrated
    
    console.log(`📊 Migrating table: ${tableName}...`);
    
    const tableExists = newDb.prepare(`
      SELECT name FROM sqlite_master 
      WHERE type='table' AND name=?
    `).get(tableName);

    if (!tableExists) {
      console.log(`   ⚪ Skipped (table doesn't exist in new DB)`);
      continue;
    }

    const schema = oldDb.prepare(`PRAGMA table_info(${tableName})`).all();
    const columns = schema.map(col => `"${col.name}"`).join(', ');
    const rows = oldDb.prepare(`SELECT * FROM ${tableName}`).all();
    
    if (rows.length === 0) {
      console.log(`   ⚪ Skipped (empty table)`);
      continue;
    }

    const insertStmt = newDb.prepare(`INSERT OR IGNORE INTO ${tableName} (${columns}) VALUES (${schema.map(() => '?').join(', ')})`);
    
    let inserted = 0;
    newDb.transaction(() => {
      for (const row of rows) {
        const values = schema.map(col => row[col.name]);
        const result = insertStmt.run(...values);
        if (result.changes > 0) inserted++;
      }
    })();

    console.log(`   ✅ Migrated ${inserted}/${rows.length} row(s)`);
    migratedCount += inserted;
  }

  // Re-enable foreign keys
  newDb.pragma('foreign_keys = ON');

  oldDb.close();
  newDb.close();

  console.log('\n✅ Migration completed successfully!\n');
  console.log(`📈 Total: ${migratedCount} rows migrated\n`);
  console.log('⚠️  Next steps:');
  console.log('   1. Update payload.config.ts to use "database.db" as your main database');
  console.log('   2. Rename: move database_new.db database.db');
  console.log('   3. Run: npm run dev');
  console.log('   4. Verify your data is intact\n');

} catch (error) {
  console.error('❌ Migration failed:', error.message);
  console.error(error);
  process.exit(1);
}
