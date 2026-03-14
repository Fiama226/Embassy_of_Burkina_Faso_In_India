import * as migration_20260301_164341 from './20260301_164341';
import * as migration_20260302_010042 from './20260302_010042';

export const migrations = [
  {
    up: migration_20260301_164341.up,
    down: migration_20260301_164341.down,
    name: '20260301_164341',
  },
  {
    up: migration_20260302_010042.up,
    down: migration_20260302_010042.down,
    name: '20260302_010042'
  },
];
