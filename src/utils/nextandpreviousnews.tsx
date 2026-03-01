import api from "@/utils/api";

type PrevNextResult = {
  previous: any | null;
  next: any | null;
};

export async function getPrevNext(
  slug: string,
): Promise<PrevNextResult> {
  try {
    // 1. Get current document
    const currentRes = await api.get(
      `/actualites/${slug}?populate=*`,
    );

    const current = currentRes.data;
    console.log("the current data are :", current);

    if (!current || !current.data) {
      return { previous: null, next: null };
    }

    const publishedAt = current.data.publishedAt;

    // 2. Previous document (older articles)
    const prevRes = await api.get(
      `/actualites?filters[publishedAt][$lt]=${publishedAt}&sort=publishedAt:desc&pagination[limit]=1`,
    );
    const previous = prevRes.data.data?.[0] || null;
    console.log("the previous data are :", previous);

    // 3. Next document (newer articles)
    const nextRes = await api.get(
      `/actualites?filters[publishedAt][$gt]=${publishedAt}&sort=publishedAt:asc&pagination[limit]=1`,
    );
    const next = nextRes.data.data?.[0] || null;
    console.log("the next data are :", next);

    return {
      previous,
      next,
    };
  } catch (error) {
    console.error("Error fetching prev/next documents:", error);
    return { previous: null, next: null };
  }
}