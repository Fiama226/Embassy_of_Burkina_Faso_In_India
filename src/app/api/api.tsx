// lib/api.ts
import { getPayload } from 'payload'
import config from '@payload-config'

// ─── Fetch all published news ──────────────────────────
export async function getActualites(locale: 'en' | 'fr' = 'fr') {
  const payload = await getPayload({ config })

  const news = await payload.find({
    collection: 'actualites',
    locale,
    where: {
      _status: { equals: 'published' },
      publishDate: { less_than_equal: new Date().toISOString() },
    },
    sort: '-publishDate',
    depth: 2,          // Populate author, categories, images
    limit: 10,
    page: 1,
  })

  return news
}

// ─── Fetch single article by slug ──────────────────────
export async function getArticleBySlug(
  slug: string,
  locale: 'en' | 'fr' = 'fr',
) {
  const payload = await getPayload({ config })

  const result = await payload.find({
    collection: 'actualites',
    locale,
    where: {
      slug: { equals: slug },
      _status: { equals: 'published' },
    },
    depth: 2,
    limit: 1,
  })

  return result.docs[0] || null
}

// ─── Fetch previous & next articles (computed!) ────────
export async function getAdjacentArticles(
  currentDate: string,
  locale: 'en' | 'fr' = 'fr',
) {
  const payload = await getPayload({ config })

  const [prevResult, nextResult] = await Promise.all([
    payload.find({
      collection: 'actualites',
      locale,
      where: {
        _status: { equals: 'published' },
        publishDate: { less_than: currentDate },
      },
      sort: '-publishDate',
      limit: 1,
      depth: 0,
    }),
    payload.find({
      collection: 'actualites',
      locale,
      where: {
        _status: { equals: 'published' },
        publishDate: { greater_than: currentDate },
      },
      sort: 'publishDate',
      limit: 1,
      depth: 0,
    }),
  ])

  return {
    previous: prevResult.docs[0] || null,
    next: nextResult.docs[0] || null,
  }
}

// ─── Fetch by category ─────────────────────────────────
export async function getActualitesByCategory(
  categorySlug: string,
  locale: 'en' | 'fr' = 'fr',
) {
  const payload = await getPayload({ config })

  // First find the category
  const catResult = await payload.find({
    collection: 'categories',
    where: { slug: { equals: categorySlug } },
    limit: 1,
  })

  if (!catResult.docs[0]) return { docs: [], totalDocs: 0 }

  return payload.find({
    collection: 'actualites',
    locale,
    where: {
      _status: { equals: 'published' },
      publishDate: { less_than_equal: new Date().toISOString() },
      categories: { contains: catResult.docs[0].id },
    },
    sort: '-publishDate',
    depth: 2,
  })
}