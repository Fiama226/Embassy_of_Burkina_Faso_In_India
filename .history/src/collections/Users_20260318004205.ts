import type { CollectionConfig } from 'payload'
import { isAdmin, isAuthenticated, isAdminOrEditor, adminFieldAccess } from '../access/index.ts'


export const Users: CollectionConfig = {
  slug: 'users',
  admin: {
    useAsTitle: 'email',
  },
  auth: {
    disableLocalStrategy: false,
    useAPIKey: false,
  },
  labels: {
    singular: { en: 'User', fr: 'Utilisateur' },
    plural: { en: 'Users', fr: 'Utilisateurs' },
  },
    access: {
    read: isAuthenticated,
    create: isAdmin,
    update: isAuthenticated,  // Users can update their own profile
    delete: isAdmin,
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
      label: { en: 'Full Name', fr: 'Nom complet' },
    },
    {
      name: 'role',
      type: 'select',
      required: true,
      defaultValue: 'author',
      label: { en: 'Role', fr: 'Rôle' },
      options: [
        { label: { en: 'Admin', fr: 'Administrateur' }, value: 'admin' },
        { label: { en: 'Editor', fr: 'Éditeur' }, value: 'editor' },
        { label: { en: 'Author', fr: 'Auteur' }, value: 'author' },
      ],
      access: {
        update: adminFieldAccess, // Only admins can change roles
      },
      admin: {
        position: 'sidebar',
        description: {
          en: 'Admin: full access | Editor: manage all posts | Author: own posts only',
          fr: 'Admin : accès complet | Éditeur : gérer tous les articles | Auteur : ses articles uniquement',
        },
      },
    },
    {
      name: 'avatar',
      type: 'upload',
      relationTo: 'media',
      label: { en: 'Avatar', fr: 'Photo de profil' },
    },
  ],
}
