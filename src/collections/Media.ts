import type { CollectionConfig } from 'payload'
import { isAuthenticated } from '../access/index'
import multer from 'multer'
import { cloudinaryStorage } from './cloudinaryStorage'

const upload = multer({ storage: cloudinaryStorage })

export const Media: CollectionConfig = {
  slug: 'media',

  labels: {
    singular: { en: 'Media', fr: 'Média' },
    plural: { en: 'Media', fr: 'Médias' },
  },

  access: {
    read: () => true,
    create: isAuthenticated,
    update: isAuthenticated,
    delete: isAuthenticated,
  },

  upload: {
    disableLocalStorage: true, // 🔴 IMPORTANT
    mimeTypes: ['image/*'],
    adminThumbnail: 'thumbnail',
  },

  fields: [
    {
      name: 'alt',
      type: 'text',
      localized: true,
      label: { en: 'Alt Text', fr: 'Texte alternatif' },
      admin: {
        description: {
          en: 'Describe this image for accessibility',
          fr: "Décrivez cette image pour l'accessibilité",
        },
      },
    },
  ],
}