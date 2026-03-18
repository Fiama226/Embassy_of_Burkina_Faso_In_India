import React from "react";
import { headers } from "next/headers";
import { getTranslations, getLocale } from "next-intl/server";
import { Link } from "@/i18n/routing";
import { RichText as RichTextConverter } from "@payloadcms/richtext-lexical/react";
import {
  FaCalendarAlt,
  FaArrowLeft,
  FaArrowRight,
  FaExclamationTriangle,
  FaHome,
  FaNewspaper,
} from "react-icons/fa";
import ArticleCarousel, { CarouselImage } from "./ArticleCarousel";

interface ArticleData {
  title: string;
  slug: string;
  publishDate: string;
  content: any; // Lexical rich text
  carousel?: CarouselImage[];
  data?: {
    textjustaftertitle?: string;
  };
  category?: string;
}

interface AdjacentArticle {
  title: string;
  slug: string;
  publishDate?: string;
}

function formatDate(dateString: string, locale: string): string {
  try {
    return new Date(dateString).toLocaleDateString(
      locale === "fr" ? "fr-FR" : "en-US",
      {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
      }
    );
  } catch {
    return dateString;
  }
}

function AdjacentLink({
  article,
  direction,
  label,
}: {
  article: AdjacentArticle;
  direction: "prev" | "next";
  label: string;
}) {
  const isPrev = direction === "prev";

  return (
    <Link
      href={`/News/${article.slug}`}
      className={`
        group flex flex-col gap-2 p-5 rounded-xl
        border border-stone-200 bg-white
        hover:shadow-md hover:border-stone-300
        transition-all duration-300
        focus-visible:outline-none focus-visible:ring-2
        focus-visible:ring-stone-900 focus-visible:ring-offset-2
        ${isPrev ? "text-left" : "text-right"}
      `}
    >
      <span className={`
        inline-flex items-center gap-1.5
        text-xs font-bold uppercase tracking-widest text-stone-400
        ${isPrev ? "" : "self-end"}
      `}>
        {isPrev && (
          <FaArrowLeft
            className="w-3 h-3 group-hover:-translate-x-1 transition-transform"
            aria-hidden="true"
          />
        )}
        {label}
        {!isPrev && (
          <FaArrowRight
            className="w-3 h-3 group-hover:translate-x-1 transition-transform"
            aria-hidden="true"
          />
        )}
      </span>
      <span className="font-serif font-bold text-stone-900 group-hover:text-red-800 transition-colors leading-snug line-clamp-2">
        {article.title}
      </span>
    </Link>
  );
}

export default async function NewsArticlePage({
  params,
}: {
  params: Promise<{ documentslug: string; locale: string }>;
}) {
  const { documentslug, locale } = await params;
  const t = await getTranslations("New");

  let article: ArticleData | null = null;
  let previous: AdjacentArticle | null = null;
  let next: AdjacentArticle | null = null;

  try {
    const headersList = await headers();
    const host = headersList.get("host") || "localhost:3000";
    const protocol = host.includes("localhost") ? "http" : "https";
    const baseUrl = `${protocol}://${host}`;

    // Note: If dynamic routing generates build errors due to missing host headers at build time
    // then consider moving absolute URL generation to client or handling statically.
    // For runtime, this is valid.
    const [articleRes, adjacentRes] = await Promise.all([
      fetch(`${baseUrl}/api/new/${resolvedParams.documentslug}?locale=${resolvedParams.locale}`, { cache: "no-store" }),
      fetch(`${baseUrl}/api/getAdjacentArticles/${resolvedParams.documentslug}?locale=${resolvedParams.locale}`, { cache: "no-store" }),
    ]);

    if (articleRes.ok) {
      const articleData = await articleRes.json();
      article = articleData.docs?.[0] || null;
    }

    if (adjacentRes.ok) {
      const adjacentData = await adjacentRes.json();
      previous = adjacentData.previous || null;
      next = adjacentData.next || null;
    }
  } catch (err) {
    console.error("Error fetching article data:", err);
  }

  if (!article) {
    return (
      <main className="min-h-screen bg-stone-50 flex flex-col items-center py-24 px-4 text-center">
        <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-6">
          <FaExclamationTriangle className="w-7 h-7 text-red-600" aria-hidden="true" />
        </div>
        <h1 className="text-2xl font-serif font-bold text-stone-900 mb-3">
          {t("error.title")}
        </h1>
        <p className="text-stone-600 mb-8 leading-relaxed max-w-md mx-auto">
          {t("error.message")}
        </p>
        <div className="flex items-center justify-center gap-4">
          <Link
            href="/News"
            className="
              inline-flex items-center gap-2 px-6 py-3
              border-2 border-stone-200 rounded-xl
              text-stone-700 font-semibold
              hover:border-stone-300 hover:bg-stone-50
              transition-all
              focus-visible:outline-none focus-visible:ring-2
              focus-visible:ring-stone-900 focus-visible:ring-offset-2
            "
          >
            <FaArrowLeft className="w-4 h-4" aria-hidden="true" />
            {t("back_to_news")}
          </Link>
        </div>
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-stone-50">
      <div className="border-b border-stone-200">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10 lg:py-14">
          <nav aria-label={t("breadcrumb")} className="flex items-center gap-2 text-sm text-stone-400 mb-6">
            <Link href="/" className="hover:text-stone-700 transition-colors focus-visible:outline-none focus-visible:underline">
              <FaHome className="w-3.5 h-3.5" aria-hidden="true" />
              <span className="sr-only">{t("home")}</span>
            </Link>
            <span aria-hidden="true">/</span>
            <Link href="/News" className="hover:text-stone-700 transition-colors focus-visible:outline-none focus-visible:underline">
              {t("news")}
            </Link>
            <span aria-hidden="true">/</span>
            <span className="text-stone-600 truncate max-w-[200px]" aria-current="page">
              {article.title}
            </span>
          </nav>

          {article.category && (
            <div className="mb-4">
              <span className="inline-flex items-center gap-1.5 bg-red-50 text-red-700 px-3 py-1 rounded-full text-xs font-bold uppercase tracking-widest">
                <FaNewspaper className="w-3 h-3" aria-hidden="true" />
                {article.category}
              </span>
            </div>
          )}

          <h1 className="text-3xl sm:text-4xl lg:text-5xl font-serif font-bold text-stone-900 leading-tight mb-4">
            {article.title}
          </h1>

          <div className="flex items-center gap-2 text-stone-500">
            <FaCalendarAlt className="w-3.5 h-3.5" aria-hidden="true" />
            <time dateTime={article.publishDate} className="text-sm font-medium">
              {formatDate(article.publishDate, locale)}
            </time>
          </div>
        </div>
      </div>

      <article className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10 lg:py-14">
        {article.data?.textjustaftertitle && (
          <div className="mb-10 text-lg text-stone-700 leading-relaxed font-medium border-l-4 border-red-600 pl-6">
            <p>{article.data.textjustaftertitle}</p>
          </div>
        )}

        {article.carousel && article.carousel.length > 0 && (
          <div className="mb-10">
            <ArticleCarousel
              images={article.carousel}
              slideLabel={t("carousel.slide")}
              pauseLabel={t("carousel.pause")}
              playLabel={t("carousel.play")}
            />
          </div>
        )}

        {article.content && (
          <div className="prose prose-stone prose-lg max-w-none prose-headings:font-serif prose-headings:font-bold prose-headings:text-stone-900 prose-a:text-red-700 prose-a:no-underline hover:prose-a:underline prose-img:rounded-xl prose-img:shadow-lg prose-blockquote:border-red-600 prose-blockquote:bg-stone-50 prose-blockquote:rounded-r-xl prose-blockquote:py-1 prose-strong:text-stone-900">
            <RichTextConverter data={article.content} />
          </div>
        )}

        <div className="my-12 flex items-center gap-4" aria-hidden="true">
          <span className="h-px flex-1 bg-stone-200" />
          <span className="w-2 h-2 rounded-full bg-gradient-to-r from-red-600 to-green-600" />
          <span className="h-px flex-1 bg-stone-200" />
        </div>

        {(previous || next) && (
          <nav aria-label={t("article_navigation")} className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            {previous ? (
              <AdjacentLink article={previous} direction="prev" label={t("previous")} />
            ) : (
              <div />
            )}
            {next ? (
              <AdjacentLink article={next} direction="next" label={t("next")} />
            ) : (
              <div />
            )}
          </nav>
        )}

        <div className="mt-10 text-center">
          <Link href="/News" className="inline-flex items-center gap-2 text-sm font-semibold text-stone-500 hover:text-stone-900 transition-colors focus-visible:outline-none focus-visible:underline">
            <FaArrowLeft className="w-3.5 h-3.5" aria-hidden="true" />
            {t("back_to_news")}
          </Link>
        </div>
      </article>
    </main>
  );
}