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
    const { slug } = await params;
    const payload = await getPayload({ config });

    const result = await payload.find({
      collection: 'actualites',
      locale,
      where: {
        slug: { equals: slug },
        _status: { equals: 'published' },
      },
      sort: '-publishDate',
      depth: 2,
      limit: 1,
    });

    if (!result.docs.length) {
      return NextResponse.json({ docs: [], totalDocs: 0 }, { status: 404 });
    }

    return NextResponse.json(result);
  } catch (error) {
    console.error('Error fetching news:', error);
    return NextResponse.json({ docs: [], totalDocs: 0 }, { status: 500 });
  }
}
