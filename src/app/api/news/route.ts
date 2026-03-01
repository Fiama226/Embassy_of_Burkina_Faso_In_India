import { NextResponse } from 'next/server';
import { getPayload } from 'payload';
import config from '@payload-config';

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url);
  const locale = (searchParams.get('locale') || 'fr') as 'en' | 'fr';

  try {
    const payload = await getPayload({ config });

    const news = await payload.find({
      collection: 'actualites',
      locale,
      where: {
        _status: { equals: 'published' },
        publishDate: { less_than_equal: new Date().toISOString() },
      },
      sort: '-publishDate',
      depth: 2,
      limit: 10,
    });

    return NextResponse.json(news);
  } catch (error) {
    console.error('Error fetching news:', error);
    return NextResponse.json({ docs: [], totalDocs: 0 }, { status: 500 });
  }
}
