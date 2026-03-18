import { postgresAdapter } from "@payloadcms/db-postgres";
import { lexicalEditor } from "@payloadcms/richtext-lexical";
import path from "path";
import { buildConfig } from "payload";
import { fileURLToPath } from "url";
import sharp from "sharp";


import { Users } from "./collections/Users";
import { Media } from "./collections/Media";
import { Categories } from './collections/Categories'
import { Tags } from './collections/Tags'
import { Actualites } from './collections/Actualites'

const filename = fileURLToPath(import.meta.url);
const dirname = path.dirname(filename);

export default buildConfig({
    secret: process.env.PAYLOAD_SECRET,
  admin: {
    user: Users.slug,
    
    importMap: {
      baseDir: path.resolve(dirname),
    },
  },
  collections: [Users, Media, Categories, Tags, Actualites],
  localization: {
    locales: [
      {
        label: 'English',
        code: 'en',
      },
      {
        label: 'Français',
        code: 'fr',
      },
    ],
    defaultLocale: 'fr',   // Default to French
    fallback: true,         // Fallback to default locale if translation missing
  },

  // ─── i18n (Admin Panel UI) ───────────────────────────
  i18n: {
    fallbackLanguage: 'en',
  },
  editor: lexicalEditor(),
  secret: process.env.PAYLOAD_SECRET || "",
  typescript: {
    outputFile: path.resolve(dirname, "payload-types.ts"),
  },
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URL,
    },
  }),
  sharp,
  plugins: [],
});
