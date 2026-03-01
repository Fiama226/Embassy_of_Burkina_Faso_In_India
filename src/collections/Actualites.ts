import type { CollectionConfig } from 'payload'
import {
  isAuthenticated,
  isAdmin,
  isAdminOrEditorOrSelf,
  publishedOrAuthenticated,
} from '../access/index.ts'
import { slugify } from '../utils/slugify.ts'

export const Actualites: CollectionConfig = {
  slug: 'actualites',

  // ─── Admin Panel ────────────────────────────────────
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', '_status', 'author', 'publishDate', 'categories'],
    listSearchableFields: ['title', 'excerpt'],
    description: {
      en: 'News articles and updates',
      fr: 'Articles d\'actualité et mises à jour',
    },
  },

  labels: {
    singular: { en: 'News Article', fr: 'Actualité' },
    plural: { en: 'News', fr: 'Actualités' },
  },

  // ─── Draft / Publish Workflow ────────────────────────
  versions: {
    drafts: {
      autosave: {
        interval: 300, // Auto-save every 5 minutes
      },
    },
    maxPerDoc: 10, // Keep last 10 versions
  },

  // ─── Access Control ─────────────────────────────────
  access: {
    read: publishedOrAuthenticated,
    create: isAuthenticated,
    update: isAdminOrEditorOrSelf,
    delete: isAdmin,
    readVersions: isAuthenticated,
  },

  // ─── Collection Hooks ───────────────────────────────
  hooks: {
    beforeChange: [
      // Auto-assign author on creation
      ({ data, req, operation }) => {
        if (operation === 'create' && req.user) {
          data.author = data.author || req.user.id
        }
        return data
      },
      // Prevent authors from publishing (only editors/admins can)
      ({ data, req }) => {
        if (
          data._status === 'published' &&
          req.user?.role === 'author'
        ) {
          data._status = 'draft' // Force back to draft
        }
        return data
      },
    ],
  },

  // ─── Default Sort ────────────────────────────────────
  defaultSort: '-publishDate',

  // ─── Fields ──────────────────────────────────────────
  fields: [
    // ════════════════════════════════════════════════════
    //  TABS LAYOUT
    // ════════════════════════════════════════════════════
    {
      type: 'tabs',
      tabs: [
        // ── TAB 1: Content ─────────────────────────────
        {
          label: { en: 'Content', fr: 'Contenu' },
          fields: [
            {
              name: 'title',
              type: 'text',
              required: true,
              localized: true,
              label: { en: 'Title', fr: 'Titre' },
            },
            {
              name: 'excerpt',
              type: 'textarea',
              localized: true,
              maxLength: 300,
              label: { en: 'Excerpt', fr: 'Résumé' },
              admin: {
                description: {
                  en: 'Short summary displayed on listing pages and cards',
                  fr: 'Court résumé affiché sur les pages de liste et les cartes',
                },
              },
            },
            {
              name: 'textBeforeCarousel',
              type: 'richText',
              localized: true,
              label: {
                en: 'Text Before Carousel',
                fr: 'Texte avant le carrousel',
              },
            },
            // ── Carousel (Optional) ──────────────────
            {
              name: 'carousel',
              type: 'array',
              label: { en: 'Carousel Images', fr: 'Images du carrousel' },
              labels: {
                singular: { en: 'Image', fr: 'Image' },
                plural: { en: 'Images', fr: 'Images' },
              },
              admin: {
                description: {
                  en: 'Optional — Add images for the carousel',
                  fr: 'Optionnel — Ajoutez des images pour le carrousel',
                },
              },
              fields: [
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  required: true,
                  label: { en: 'Image', fr: 'Image' },
                },
                {
                  name: 'caption',
                  type: 'text',
                  localized: true,
                  label: { en: 'Caption', fr: 'Légende' },
                },
              ],
            },
            // ── Main Content ─────────────────────────
            {
              name: 'content',
              type: 'richText',
              required: true,
              localized: true,
              label: { en: 'Content', fr: 'Contenu' },
            },
          ],
        },

        // ── TAB 2: SEO ─────────────────────────────────
        {
          label: 'SEO',
          fields: [
            {
              name: 'metaTitle',
              type: 'text',
              localized: true,
              label: { en: 'Meta Title', fr: 'Titre Meta' },
              admin: {
                description: {
                  en: 'Defaults to article title if left empty (max ~60 chars)',
                  fr: 'Par défaut : le titre de l\'article si laissé vide (max ~60 car.)',
                },
              },
              maxLength: 70,
            },
            {
              name: 'metaDescription',
              type: 'textarea',
              localized: true,
              label: { en: 'Meta Description', fr: 'Description Meta' },
              admin: {
                description: {
                  en: 'Short description for search engines (max 160 chars)',
                  fr: 'Courte description pour les moteurs de recherche (max 160 car.)',
                },
              },
              maxLength: 160,
            },
            {
              name: 'ogImage',
              type: 'upload',
              relationTo: 'media',
              label: { en: 'Social Share Image', fr: 'Image de partage social' },
              admin: {
                description: {
                  en: 'Recommended: 1200×630px. Used when sharing on social media',
                  fr: 'Recommandé : 1200×630px. Utilisé lors du partage sur les réseaux sociaux',
                },
              },
            },
          ],
        },
      ],
    },

    // ════════════════════════════════════════════════════
    //  SIDEBAR FIELDS
    // ════════════════════════════════════════════════════
    {
      name: 'slug',
      type: 'text',
      required: true,
      unique: true,
      label: { en: 'Slug', fr: 'Identifiant URL' },
      admin: {
        position: 'sidebar',
        description: {
          en: 'Auto-generated from title. Used in the URL',
          fr: 'Généré automatiquement à partir du titre. Utilisé dans l\'URL',
        },
      },
      hooks: {
        beforeValidate: [
          ({ value, data, operation }) => {
            if (!value && data?.title) {
              console.log(slugify(data.title))
              return slugify(data.title)
            }
            return value
          },
        ],
      },
    },
    {
      name: 'author',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      label: { en: 'Author', fr: 'Auteur' },
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'publishDate',
      type: 'date',
      required: true,
      label: { en: 'Publish Date', fr: 'Date de publication' },
      admin: {
        position: 'sidebar',
        date: {
          pickerAppearance: 'dayAndTime',
        },
        description: {
          en: 'Set a future date to schedule publication',
          fr: 'Définir une date future pour planifier la publication',
        },
      },
      defaultValue: () => new Date().toISOString(),
    },
    {
      name: 'categories',
      type: 'relationship',
      relationTo: 'categories',
      hasMany: true,
      label: { en: 'Categories', fr: 'Catégories' },
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'tags',
      type: 'relationship',
      relationTo: 'tags',
      hasMany: true,
      label: { en: 'Tags', fr: 'Étiquettes' },
      admin: {
        position: 'sidebar',
      },
    },
  ],
}