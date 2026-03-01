import type { Access, FieldAccess } from 'payload'

// ─── Collection-level Access ──────────────────────────

/** Anyone can read (with filters applied per collection) */
export const isPublic: Access = () => true

/** Must be logged in */
export const isAuthenticated: Access = ({ req: { user } }) => Boolean(user)

/** Admin only */
export const isAdmin: Access = ({ req: { user } }) => {
  return user?.role === 'admin'
}

/** Admin or Editor */
export const isAdminOrEditor: Access = ({ req: { user } }) => {
  return user?.role === 'admin' || user?.role === 'editor'
}

/**
 * Admin/Editor → all documents
 * Author → only their own documents
 */
export const isAdminOrEditorOrSelf: Access = ({ req: { user } }) => {
  if (!user) return false
  if (user.role === 'admin' || user.role === 'editor') return true
  // Author: restrict to their own posts
  return {
    author: {
      equals: user.id,
    },
  }
}

/**
 * Public users → only published posts with past/present publishDate
 * Authenticated → all posts (including drafts for editing)
 */
export const publishedOrAuthenticated: Access = ({ req: { user } }) => {
  if (user) return true // Logged-in users see everything
  return {
    and: [
      { _status: { equals: 'published' } },
      { publishDate: { less_than_equal: new Date().toISOString() } },
    ],
  }
}

// ─── Field-level Access ───────────────────────────────

/** Only admins can edit this field */
export const adminFieldAccess: FieldAccess = ({ req: { user } }) => {
  return user?.role === 'admin'
}