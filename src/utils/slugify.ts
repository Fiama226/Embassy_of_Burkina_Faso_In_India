/**
 * Converts a string to a URL-friendly slug.
 * Handles French accents (é→e, è→e, ç→c, etc.)
 */
export function slugify(text: string): string {
  return text
    .toString()
    .normalize("NFD")                   // Handle accents (é → e)
    .replace(/[\u0300-\u036f]/g, "")    // Remove diacritics
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, "")      // Remove special chars
    .replace(/[\s_]+/g, "-")            // Spaces/underscores → hyphens
    .replace(/-+/g, "-")               // Collapse multiple hyphens
    .replace(/^-+|-+$/g, "");          // Trim leading/trailing hyphens
}