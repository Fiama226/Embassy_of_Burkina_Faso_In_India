import type { CollectionConfig } from 'payload'
import { isAdminOrEditor } from '../access/index.ts'
import { slugify } from '../utils/slugify.ts'

export const Categories: CollectionConfig = {
  slug: 'categories',
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'slug'],
  },
  labels: {
    singular: { en: 'Category', fr: 'Catégorie' },
    plural: { en: 'Categories', fr: 'Catégories' },
  },
  access: {
    read: () => true,
    create: isAdminOrEditor,
    update: isAdminOrEditor,
    delete: isAdminOrEditor,
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
      localized: true,
      label: { en: 'Name', fr: 'Nom' },
    },
    {
      name: 'slug',
      type: 'text',
      required: true,
      unique: true,
      label: { en: 'Slug', fr: 'Identifiant URL' },
      admin: {
        position: 'sidebar',
        description: {
          en: 'Auto-generated from name if left empty',
          fr: 'Généré automatiquement à partir du nom si laissé vide',
        },
      },
      hooks: {
        beforeValidate: [
          ({ value, data }) => {
            if (!value && data?.name) {
              return slugify(data.name)
            }
            return value
          },
        ],
      },
    },
    {
      name: 'description',
      type: 'textarea',
      localized: true,
      label: { en: 'Description', fr: 'Description' },
    },
  ],
}