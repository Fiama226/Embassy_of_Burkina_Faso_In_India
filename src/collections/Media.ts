import type { CollectionConfig } from 'payload'
import { isAuthenticated } from '../access/index.ts'


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
  fields: [
    {
      name: 'alt',
      type: 'text',
      localized: true,
      label: { en: 'Alt Text', fr: 'Texte alternatif' },
      admin: {
        description: {
          en: 'Describe this image for accessibility',
          fr: 'Décrivez cette image pour l\'accessibilité',
        },
      },
    },
  ],
   upload: {
    mimeTypes: ['image/*'],
    imageSizes: [
      {
        name: 'thumbnail',
        width: 400,
        height: 300,
        position: 'centre',
      },
      {
        name: 'card',
        width: 768,
        height: 512,
        position: 'centre',
      },
      {
        name: 'hero',
        width: 1920,
        height:undefined

}
    ],
    adminThumbnail: 'thumbnail'
  }}
