
"use client";

import React, { useState, useEffect, useCallback, useRef } from "react";
import Image from "next/image";
import { useParams } from "next/navigation";
import { useTranslations, useLocale } from "next-intl";
import { Link } from "@/i18n/routing";
import { RichText as RichTextConverter } from "@payloadcms/richtext-lexical/react";
import {
  FaChevronLeft,
  FaChevronRight,
  FaPause,
  FaPlay,
  FaCalendarAlt,
  FaArrowLeft,
  FaArrowRight,
  FaExclamationTriangle,
  FaHome,
  FaNewspaper,
} from "react-icons/fa";

interface CarouselImage {
  image: {
    url: string;
    alt?: string;
    width?: number;
    height?: number;
  };
  caption?: string;
}

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

type PageStatus = "loading" | "ready" | "error";

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

// ── Image Carousel (zero dependencies) ──────────────────
function ArticleCarousel({
  images,
  slideLabel,
  pauseLabel,
  playLabel,
}: {
  images: CarouselImage[];
  slideLabel: string;
  pauseLabel: string;
  playLabel: string;
}) {
  const [current, setCurrent] = useState(0);
  const [isPaused, setIsPaused] = useState(false);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const total = images.length;

  const startAutoplay = useCallback(() => {
    if (timerRef.current) clearInterval(timerRef.current);
    timerRef.current = setInterval(() => {
      setCurrent((prev) => (prev + 1) % total);
    }, 4000);
  }, [total]);

  const stopAutoplay = useCallback(() => {
    if (timerRef.current) {
      clearInterval(timerRef.current);
      timerRef.current = null;
    }
  }, []);

  useEffect(() => {
    if (!isPaused) startAutoplay();
    else stopAutoplay();
    return stopAutoplay;
  }, [isPaused, startAutoplay, stopAutoplay]);

  const goTo = useCallback(
    (index: number) => {
      setCurrent(((index % total) + total) % total);
      if (!isPaused) startAutoplay();
    },
    [total, isPaused, startAutoplay]
  );

  if (total === 0) return null;

  // Single image — no carousel needed
  if (total === 1) {
    return (
      <figure className="rounded-2xl overflow-hidden shadow-lg">
        <div className="relative aspect-[16/9] bg-stone-100">
          <Image
            src={images[0].image.url}
            alt={images[0].image.alt || images[0].caption || ""}
            fill
            className="object-cover"
            sizes="(max-width: 768px) 100vw, 800px"
          />
        </div>
        {images[0].caption && (
          <figcaption className="bg-stone-50 px-6 py-3 text-sm text-stone-600 border-t border-stone-100">
            {images[0].caption}
          </figcaption>
        )}
      </figure>
    );
  }

  return (
    <div
      role="region"
      aria-roledescription="carousel"
      aria-label="Article images"
      className="relative rounded-2xl overflow-hidden shadow-lg bg-stone-100 group"
    >
      {/* Slides */}
      <div className="relative aspect-[16/9]">
        {images.map((img, index) => (
          <figure
            key={index}
            role="group"
            aria-roledescription="slide"
            aria-label={`${slideLabel} ${index + 1} / ${total}`}
            aria-hidden={index !== current}
            className={`
              absolute inset-0 transition-all duration-700 ease-in-out
              ${index === current ? "opacity-100" : "opacity-0"}
            `}
          >
            <Image
              src={img.image.url}
              alt={img.image.alt || img.caption || `${slideLabel} ${index + 1}`}
              fill
              className="object-cover"
              sizes="(max-width: 768px) 100vw, 800px"
              loading={index < 2 ? "eager" : "lazy"}
              priority={index === 0}
            />
          </figure>
        ))}

        {/* Caption overlay */}
        {images[current]?.caption && (
          <div className="absolute bottom-0 inset-x-0 bg-gradient-to-t from-black/70 to-transparent px-6 pb-12 pt-16">
            <p className="text-white text-sm font-medium">
              {images[current].caption}
            </p>
          </div>
        )}

        {/* Navigation arrows */}
        <button
          onClick={() => goTo(current - 1)}
          aria-label="Previous image"
          className="
            absolute left-3 top-1/2 -translate-y-1/2 z-10
            w-10 h-10 rounded-full bg-white/80 backdrop-blur-sm shadow-lg
            flex items-center justify-center
            opacity-0 group-hover:opacity-100
            hover:bg-white transition-all duration-300
            focus-visible:opacity-100 focus-visible:outline-none
            focus-visible:ring-2 focus-visible:ring-white
          "
        >
          <FaChevronLeft className="w-3.5 h-3.5 text-stone-700" aria-hidden="true" />
        </button>

        <button
          onClick={() => goTo(current + 1)}
          aria-label="Next image"
          className="
            absolute right-3 top-1/2 -translate-y-1/2 z-10
            w-10 h-10 rounded-full bg-white/80 backdrop-blur-sm shadow-lg
            flex items-center justify-center
            opacity-0 group-hover:opacity-100
            hover:bg-white transition-all duration-300
            focus-visible:opacity-100 focus-visible:outline-none
            focus-visible:ring-2 focus-visible:ring-white
          "
        >
          <FaChevronRight className="w-3.5 h-3.5 text-stone-700" aria-hidden="true" />
        </button>
      </div>

      {/* Controls bar */}
      <div className="flex items-center justify-between px-4 py-3 bg-white border-t border-stone-100">
        <span className="text-xs text-stone-400 font-mono tabular-nums">
          {String(current + 1).padStart(2, "0")} / {String(total).padStart(2, "0")}
        </span>

        <div className="flex items-center gap-1">
          {images.map((_, i) => (
            <button
              key={i}
              onClick={() => goTo(i)}
              aria-label={`${slideLabel} ${i + 1}`}
              className={`
                rounded-full transition-all duration-300
                focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-stone-900
                ${i === current ? "w-5 h-1.5 bg-stone-900" : "w-1.5 h-1.5 bg-stone-300 hover:bg-stone-500"}
              `}
            />
          ))}
        </div>

        <button
          onClick={() => setIsPaused((p) => !p)}
          aria-label={isPaused ? playLabel : pauseLabel}
          className="
            w-7 h-7 rounded-full bg-stone-100
            flex items-center justify-center
            hover:bg-stone-200 transition-colors
            focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-stone-900
          "
        >
          {isPaused ? (
            <FaPlay className="w-2.5 h-2.5 text-stone-600 ml-0.5" aria-hidden="true" />
          ) : (
            <FaPause className="w-2.5 h-2.5 text-stone-600" aria-hidden="true" />
          )}
        </button>
      </div>
    </div>
  );
}

// ── Loading Skeleton ────────────────────────────────────
function ArticleSkeleton() {
  return (
    <div className="max-w-4xl mx-auto px-4 py-12 animate-pulse">
      {/* Breadcrumb */}
      <div className="h-4 w-48 bg-stone-200 rounded mb-8" />

      {/* Category badge */}
      <div className="h-6 w-24 bg-stone-200 rounded-full mb-4" />

      {/* Title */}
      <div className="space-y-3 mb-6">
        <div className="h-10 w-full bg-stone-200 rounded" />
        <div className="h-10 w-3/4 bg-stone-200 rounded" />
      </div>

      {/* Date */}
      <div className="h-4 w-40 bg-stone-200 rounded mb-8" />

      {/* Divider */}
      <div className="h-px bg-stone-200 mb-8 w-[50%]" />

      {/* Image */}
      <div className="aspect-[16/9] bg-stone-200 rounded-2xl mb-8" />

      {/* Content lines */}
      <div className="space-y-3">
        {Array.from({ length: 8 }).map((_, i) => (
          <div
            key={i}
            className="h-4 bg-stone-200 rounded"
            style={{ width: `${85 + Math.random() * 15}%` }}
          />
        ))}
      </div>
    </div>
  );
}

// ── Error State ─────────────────────────────────────────
function ArticleError({
  onRetry,
  backLabel,
  retryLabel,
  errorTitle,
  errorMessage,
}: {
  onRetry: () => void;
  backLabel: string;
  retryLabel: string;
  errorTitle: string;
  errorMessage: string;
}) {
  return (
    <div className="max-w-xl mx-auto px-4 py-24 text-center">
      <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-6">
        <FaExclamationTriangle className="w-7 h-7 text-red-600" aria-hidden="true" />
      </div>
      <h1 className="text-2xl font-serif font-bold text-stone-900 mb-3">
        {errorTitle}
      </h1>
      <p className="text-stone-600 mb-8 leading-relaxed">
        {errorMessage}
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
          {backLabel}
        </Link>
        <button
          onClick={onRetry}
          className="
            inline-flex items-center gap-2 px-6 py-3
            bg-stone-900 text-white rounded-xl font-semibold
            hover:bg-stone-800 transition-colors
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-stone-900 focus-visible:ring-offset-2
          "
        >
          {retryLabel}
        </button>
      </div>
    </div>
  );
}

// ── Adjacent Article Link ───────────────────────────────
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
      {/* Direction label */}
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

      {/* Article title */}
      <span className="font-serif font-bold text-stone-900 group-hover:text-red-800 transition-colors leading-snug line-clamp-2">
        {article.title}
      </span>
    </Link>
  );
}

// ════════════════════════════════════════════════════════
// MAIN PAGE COMPONENT
// ════════════════════════════════════════════════════════
export default function NewsArticlePage() {
  const t = useTranslations("New");
  const locale = useLocale();
  const params = useParams<{ documentslug: string; locale: string }>();

  const [status, setStatus] = useState<PageStatus>("loading");
  const [article, setArticle] = useState<ArticleData | null>(null);
  const [previous, setPrevious] = useState<AdjacentArticle | null>(null);
  const [next, setNext] = useState<AdjacentArticle | null>(null);

  // ── Fetch Data ────────────────────────────────────────
  const fetchArticle = useCallback(async () => {
    setStatus("loading");

    const controller = new AbortController();

    try {
      // Parallel fetches
      const [articleRes, adjacentRes] = await Promise.all([
        fetch(
          `/api/new/${params.documentslug}?locale=${params.locale}`,
          { signal: controller.signal }
        ),
        fetch(
          `/api/getAdjacentArticles/${params.documentslug}?locale=${params.locale}`,
          { signal: controller.signal }
        ),
      ]);

      if (!articleRes.ok) throw new Error("Article not found");

      const articleData = await articleRes.json();
      const adjacentData = await adjacentRes.json();

      setArticle(articleData.docs?.[0] || null);
      setPrevious(adjacentData.previous || null);
      setNext(adjacentData.next || null);
      setStatus("ready");
    } catch (err) {
      if (err instanceof Error && err.name === "AbortError") return;
      setStatus("error");
    }

    return () => controller.abort();
  }, [params.documentslug, params.locale]);

  useEffect(() => {
    fetchArticle();
  }, [fetchArticle]);

  // ── Loading State ─────────────────────────────────────
  if (status === "loading") {
    return (
      <main className="min-h-screen bg-stone-50">
        <ArticleSkeleton />
      </main>
    );
  }

  // ── Error State ───────────────────────────────────────
  if (status === "error" || !article) {
    return (
      <main className="min-h-screen bg-stone-50">
        <ArticleError
          onRetry={fetchArticle}
          backLabel={t("back_to_news")}
          retryLabel={t("retry")}
          errorTitle={t("error.title")}
          errorMessage={t("error.message")}
        />
      </main>
    );
  }

  // ── Article Ready ─────────────────────────────────────
  return (
    <main className="min-h-screen bg-stone-50">
      {/* ── Hero Header ──────────────────────────────────── */}
      <div className=" border-b border-stone-200">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10 lg:py-14">
          {/* Breadcrumb */}
          <nav
            aria-label={t("breadcrumb")}
            className="flex items-center gap-2 text-sm text-stone-400 mb-6"
          >
            <Link
              href="/"
              className="hover:text-stone-700 transition-colors focus-visible:outline-none focus-visible:underline"
            >
              <FaHome className="w-3.5 h-3.5" aria-hidden="true" />
              <span className="sr-only">{t("home")}</span>
            </Link>
            <span aria-hidden="true">/</span>
            <Link
              href="/News"
              className="hover:text-stone-700 transition-colors focus-visible:outline-none focus-visible:underline"
            >
              {t("news")}
            </Link>
            <span aria-hidden="true">/</span>
            <span className="text-stone-600 truncate max-w-[200px]" aria-current="page">
              {article.title}
            </span>
          </nav>

          {/* Category badge */}
          {article.category && (
            <div className="mb-4">
              <span className="inline-flex items-center gap-1.5 bg-red-50 text-red-700 px-3 py-1 rounded-full text-xs font-bold uppercase tracking-widest">
                <FaNewspaper className="w-3 h-3" aria-hidden="true" />
                {article.category}
              </span>
            </div>
          )}

          {/* Title */}
          <h1 className="text-3xl sm:text-4xl lg:text-5xl font-serif font-bold text-stone-900 leading-tight mb-4">
            {article.title}
          </h1>

          {/* Date */}
          <div className="flex items-center gap-2 text-stone-500">
            <FaCalendarAlt className="w-3.5 h-3.5" aria-hidden="true" />
            <time dateTime={article.publishDate} className="text-sm font-medium">
              {formatDate(article.publishDate, locale)}
            </time>
          </div>
        </div>
      </div>

      {/* ── Article Body ─────────────────────────────────── */}
      <article className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10 lg:py-14">
        {/* Intro text (if any) */}
        {article.data?.textjustaftertitle && (
          <div className="mb-10 text-lg text-stone-700 leading-relaxed font-medium border-l-4 border-red-600 pl-6">
            <p>{article.data.textjustaftertitle}</p>
          </div>
        )}

        {/* Carousel */}
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

        {/* Rich Text Content */}
        {article.content && (
          <div
            className="
              prose prose-stone prose-lg max-w-none
              prose-headings:font-serif prose-headings:font-bold
              prose-headings:text-stone-900
              prose-a:text-red-700 prose-a:no-underline
              hover:prose-a:underline
              prose-img:rounded-xl prose-img:shadow-lg
              prose-blockquote:border-red-600
              prose-blockquote:bg-stone-50
              prose-blockquote:rounded-r-xl
              prose-blockquote:py-1
              prose-strong:text-stone-900
            "
          >
            <RichTextConverter data={article.content} />
          </div>
        )}

        {/* ── Divider ──────────────────────────────────── */}
        <div className="my-12 flex items-center gap-4" aria-hidden="true">
          <span className="h-px flex-1 bg-stone-200" />
          <span className="w-2 h-2 rounded-full bg-gradient-to-r from-red-600 to-green-600" />
          <span className="h-px flex-1 bg-stone-200" />
        </div>

        {/* ── Previous / Next Navigation ─────────────────── */}
        {(previous || next) && (
          <nav
            aria-label={t("article_navigation")}
            className="grid grid-cols-1 sm:grid-cols-2 gap-4"
          >
            {previous ? (
              <AdjacentLink
                article={previous}
                direction="prev"
                label={t("previous")}
              />
            ) : (
              <div /> // Empty cell to maintain grid
            )}

            {next ? (
              <AdjacentLink
                article={next}
                direction="next"
                label={t("next")}
              />
            ) : (
              <div />
            )}
          </nav>
        )}

        {/* ── Back to News ───────────────────────────────── */}
        <div className="mt-10 text-center">
          <Link
            href="/News"
            className="
              inline-flex items-center gap-2
              text-sm font-semibold text-stone-500
              hover:text-stone-900 transition-colors
              focus-visible:outline-none focus-visible:underline
            "
          >
            <FaArrowLeft className="w-3.5 h-3.5" aria-hidden="true" />
            {t("back_to_news")}
          </Link>
        </div>
      </article>
    </main>
  );
}