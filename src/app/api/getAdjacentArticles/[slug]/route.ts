import { NextResponse } from 'next/server';
import { getPayload } from 'payload';
import config from '@payload-config';

export async function GET(
  req: Request,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { searchParams } = new URL(req.url);
  const locale = (searchParams.get('locale') || 'fr') as 'en' | 'fr';

  try {
    // ✅ Await params
    const { slug } = await params;

    const payload = await getPayload({ config });

    // Find the current document by slug
    const currentDocResult = await payload.find({
      collection: 'actualites',
      locale,
      where: {
        slug: { equals: slug },
        _status: { equals: 'published' },
      },
      limit: 1,
      depth: 0,
    });

    const currentDoc = currentDocResult.docs[0];
    if (!currentDoc) {
      return NextResponse.json({ error: 'Document not found' }, { status: 404 });
    }

    const currentDate = currentDoc.publishDate;

    // Find previous and next relative to current publishDate
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
    ]);

    return NextResponse.json({
      previous: prevResult.docs[0] || null,
      next: nextResult.docs[0] || null,
    });
  } catch (error) {
    console.error('Error fetching news:', error);
    return NextResponse.json({ docs: [], totalDocs: 0 }, { status: 500 });
  }
}