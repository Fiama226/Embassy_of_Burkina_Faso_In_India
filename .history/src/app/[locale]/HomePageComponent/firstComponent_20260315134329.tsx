// ============================================
// File: components/home/HeroSection.tsx
// ============================================

"use client";

import React, {
  useState,
  useEffect,
  useCallback,
  useRef,
  memo,
} from "react";
import { useTranslations, useLocale } from "next-intl";
import { FaClock, FaPause, FaPlay, FaChevronLeft, FaChevronRight } from "react-icons/fa";
import  Image from "next/image";

// ── Gallery Images ─────────────────────────────────────────
// Each image gets a unique, descriptive alt key for accessibility
const GALLERY_IMAGES = [
  { src: "/SliderImages/1.jpg", altKey: "gallery.alt_1" },
  { src: "/SliderImages/2.jpg", altKey: "gallery.alt_2" },
  { src: "/SliderImages/3.jpg", altKey: "gallery.alt_3" },
  { src: "/SliderImages/4.jpg", altKey: "gallery.alt_4" },
  { src: "/SliderImages/5.jpg", altKey: "gallery.alt_5" },
  { src: "/SliderImages/6.jpg", altKey: "gallery.alt_6" },
  { src: "/SliderImages/7.jpg", altKey: "gallery.alt_7" },
  { src: "/SliderImages/8.jpg", altKey: "gallery.alt_8" },
  { src: "/SliderImages/9.jpg", altKey: "gallery.alt_9" },
  { src: "/SliderImages/10.jpg", altKey: "gallery.alt_10" },
  { src: "/SliderImages/12.jpg", altKey: "gallery.alt_12" },
  { src: "/SliderImages/15.jpeg", altKey: "gallery.alt_15" },
  { src: "/SliderImages/16.jpg", altKey: "gallery.alt_16" },
  { src: "/SliderImages/17.jpeg", altKey: "gallery.alt_17" },
  { src: "/SliderImages/18.jpg", altKey: "gallery.alt_18" },
  { src: "/SliderImages/19.jpg", altKey: "gallery.alt_19" },
  { src: "/SliderImages/20.jpg", altKey: "gallery.alt_20" },
  { src: "/SliderImages/21.jpg", altKey: "gallery.alt_21" },
  { src: "/SliderImages/22.jpg", altKey: "gallery.alt_22" },
  { src: "/SliderImages/23.jpg", altKey: "gallery.alt_23" },
  { src: "/SliderImages/24.jpg", altKey: "gallery.alt_24" },
  { src: "/SliderImages/25.jpg", altKey: "gallery.alt_25" },
];

const AUTOPLAY_INTERVAL = 4000;

// ── TimeCard (memoized — won't re-render when carousel changes) ──
interface TimeCardProps {
  flagSrc: string;
  flagAlt: string;
  city: string;
  country: string;
  timezone: string;
  localTimeLabel: string;
}

const TimeCard = memo(function TimeCard({
  flagSrc,
  flagAlt,
  city,
  country,
  timezone,
  localTimeLabel,
}: TimeCardProps) {
  const locale = useLocale();
  const [time, setTime] = useState<Date | null>(null);

  // ✅ Clock is isolated — only this card re-renders every second
  useEffect(() => {
    setTime(new Date());
    const interval = setInterval(() => setTime(new Date()), 1000);
    return () => clearInterval(interval);
  }, []);

  // Ensure flagSrc starts with / and not http/https
  const normalizedFlagSrc = flagSrc.startsWith('http') 
    ? new URL(flagSrc).pathname 
    : flagSrc;

  const localeTag = locale === "fr" ? "fr-FR" : "en-US";

  const formattedDate = time?.toLocaleDateString(localeTag, {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
    timeZone: timezone,
  });

  const formattedTime = time?.toLocaleTimeString(localeTag, {
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
    hour12: false,
    timeZone: timezone,
  });

  return (
    <article className="bg-white rounded-2xl p-5 shadow-md border border-stone-100 hover:shadow-lg transition-shadow duration-300">
      {/* Flag */}
      <div className="flex justify-center mb-3">
        <div className="w-16 h-11 rounded-lg overflow-hidden shadow-sm ring-1 ring-stone-200 bg-white" style={{ minWidth: '64px', minHeight: '44px' }}>
          {/* Using img tag for SVG flags - Next.js Image doesn't optimize SVGs */}
          <img
            src={normalizedFlagSrc}
            alt={flagAlt}
            className="w-full h-full object-cover block"
            width="64"
            height="44"
            loading="lazy"
            decoding="async"
            style={{ display: 'block', visibility: 'visible' }}
            onError={(e) => {
              console.error(`Failed to load flag: ${normalizedFlagSrc}`, e);
              // Fallback: try alternate path without leading slash if it exists
              const target = e.target as HTMLImageElement;
              if (normalizedFlagSrc.startsWith('/')) {
                target.src = normalizedFlagSrc.substring(1);
              }
            }}
          />
        </div>
      </div>

      {/* Location */}
      <div className="text-center mb-3">
        <p className="text-xs font-medium text-stone-500 uppercase tracking-wide">
          {city}
        </p>
        <p className="text-lg font-bold font-serif text-stone-900">
          {country}
        </p>
      </div>

      {/* Time */}
      <div className="bg-stone-50 rounded-xl p-3.5 space-y-1.5">
        <div className="flex items-center justify-center gap-1.5 text-stone-500">
          <FaClock className="w-3 h-3" aria-hidden="true" />
          <p className="text-[10px] font-bold uppercase tracking-widest">
            {localTimeLabel}
          </p>
        </div>

        {time ? (
          <>
            <p className="text-xs text-stone-600 text-center capitalize leading-relaxed">
              {formattedDate}
            </p>
            <p
              className="text-xl font-mono font-bold text-stone-900 text-center tracking-wider tabular-nums"
              aria-live="off"
              // aria-live="off" — don't announce time changes to screen readers
            >
              {formattedTime}
            </p>
          </>
        ) : (
          // ✅ Skeleton while hydrating — avoids layout shift
          <div className="space-y-1.5 animate-pulse">
            <div className="h-3 bg-stone-200 rounded w-3/4 mx-auto" />
            <div className="h-6 bg-stone-200 rounded w-1/2 mx-auto" />
          </div>
        )}
      </div>
    </article>
  );
});

// ── ImageCarousel (zero external dependencies) ─────────────
interface CarouselProps {
  galleryLabel: string;
  slideLabel: string;
  pauseLabel: string;
  playLabel: string;
}

function ImageCarousel({
  galleryLabel,
  slideLabel,
  pauseLabel,
  playLabel,
}: CarouselProps) {
  const t = useTranslations("Homepage.Hero");
  const [current, setCurrent] = useState(0);
  const [isPaused, setIsPaused] = useState(false);
  const [isHovered, setIsHovered] = useState(false);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const total = GALLERY_IMAGES.length;

  // ── Autoplay ──────────────────────────────────────────
  const startAutoplay = useCallback(() => {
    if (timerRef.current) clearInterval(timerRef.current);
    timerRef.current = setInterval(() => {
      setCurrent((prev) => (prev + 1) % total);
    }, AUTOPLAY_INTERVAL);
  }, [total]);

  const stopAutoplay = useCallback(() => {
    if (timerRef.current) {
      clearInterval(timerRef.current);
      timerRef.current = null;
    }
  }, []);

  useEffect(() => {
    if (!isPaused && !isHovered) {
      startAutoplay();
    } else {
      stopAutoplay();
    }
    return stopAutoplay;
  }, [isPaused, isHovered, startAutoplay, stopAutoplay]);

  // ── Navigation ────────────────────────────────────────
  const goTo = useCallback(
    (index: number) => {
      setCurrent(((index % total) + total) % total);
      if (!isPaused) startAutoplay(); // Reset timer on manual nav
    },
    [total, isPaused, startAutoplay]
  );

  const goNext = useCallback(() => goTo(current + 1), [current, goTo]);
  const goPrev = useCallback(() => goTo(current - 1), [current, goTo]);

  // ── Keyboard ──────────────────────────────────────────
  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent) => {
      if (e.key === "ArrowRight") {
        e.preventDefault();
        goNext();
      } else if (e.key === "ArrowLeft") {
        e.preventDefault();
        goPrev();
      }
    },
    [goNext, goPrev]
  );

  return (
    <div
      role="region"
      aria-roledescription="carousel"
      aria-label={galleryLabel}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
      onKeyDown={handleKeyDown}
      className="relative"
    >
      {/* ── Slide Container ───────────────────────────── */}
      <div className="relative aspect-[4/3] rounded-2xl overflow-hidden bg-stone-100 shadow-xl">
        {GALLERY_IMAGES.map((img, index) => (
          <div
            key={img.src}
            role="group"
            aria-roledescription="slide"
            aria-label={`${slideLabel} ${index + 1} / ${total}`}
            aria-hidden={index !== current}
            className={`
              absolute inset-0
              transition-all duration-700 ease-in-out
              ${
                index === current
                  ? "opacity-100 scale-100"
                  : "opacity-0 scale-105"
              }
            `}
          >
            <Image
              src={img.src}
              alt={t(img.altKey)}
              fill
              className="object-cover"
              sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 45vw"
              loading={index < 3 ? "eager" : "lazy"}
              priority={index === 0}
            />
          </div>
        ))}

        {/* ── Bottom Gradient Overlay ─────────────────── */}
        <div
          className="absolute inset-x-0 bottom-0 h-24 bg-gradient-to-t from-black/50 to-transparent"
          aria-hidden="true"
        />

        {/* ── Navigation Arrows ──────────────────────── */}
        <button
          onClick={goPrev}
          aria-label={t("carousel.prev")}
          className="
            absolute left-3 top-1/2 -translate-y-1/2 z-10
            w-10 h-10 rounded-full
            bg-white/80 backdrop-blur-sm shadow-lg
            flex items-center justify-center
            opacity-0 group-hover:opacity-100
            hover:bg-white
            transition-all duration-300
            focus-visible:opacity-100
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-white focus-visible:ring-offset-2
            focus-visible:ring-offset-stone-900
          "
        >
          <FaChevronLeft className="w-3.5 h-3.5 text-stone-700" aria-hidden="true" />
        </button>

        <button
          onClick={goNext}
          aria-label={t("carousel.next")}
          className="
            absolute right-3 top-1/2 -translate-y-1/2 z-10
            w-10 h-10 rounded-full
            bg-white/80 backdrop-blur-sm shadow-lg
            flex items-center justify-center
            opacity-0 group-hover:opacity-100
            hover:bg-white
            transition-all duration-300
            focus-visible:opacity-100
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-white focus-visible:ring-offset-2
            focus-visible:ring-offset-stone-900
          "
        >
          <FaChevronRight className="w-3.5 h-3.5 text-stone-700" aria-hidden="true" />
        </button>

        {/* ── Bottom Controls Bar ────────────────────── */}
        <div className="absolute bottom-0 inset-x-0 z-10 flex items-center justify-between px-4 pb-3">
          {/* Slide Counter */}
          <span className="text-white/80 text-xs font-mono font-medium tabular-nums">
            {String(current + 1).padStart(2, "0")} / {String(total).padStart(2, "0")}
          </span>

          {/* Progress Dots */}
          <div className="flex items-center gap-1" role="tablist" aria-label={t("carousel.dots_label")}>
            {GALLERY_IMAGES.map((_, index) => (
              <button
                key={index}
                role="tab"
                aria-selected={index === current}
                aria-label={`${slideLabel} ${index + 1}`}
                onClick={() => goTo(index)}
                className={`
                  rounded-full transition-all duration-300
                  focus-visible:outline-none focus-visible:ring-2
                  focus-visible:ring-white
                  ${
                    index === current
                      ? "w-6 h-1.5 bg-white"
                      : "w-1.5 h-1.5 bg-white/40 hover:bg-white/70"
                  }
                `}
              />
            ))}
          </div>

          {/* Pause/Play */}
          <button
            onClick={() => setIsPaused((p) => !p)}
            aria-label={isPaused ? playLabel : pauseLabel}
            className="
              w-7 h-7 rounded-full bg-white/20 backdrop-blur-sm
              flex items-center justify-center
              hover:bg-white/30 transition-colors
              focus-visible:outline-none focus-visible:ring-2
              focus-visible:ring-white
            "
          >
            {isPaused ? (
              <FaPlay className="w-2.5 h-2.5 text-white ml-0.5" aria-hidden="true" />
            ) : (
              <FaPause className="w-2.5 h-2.5 text-white" aria-hidden="true" />
            )}
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Main Hero Section ──────────────────────────────────────
export default function HeroSection() {
  const t = useTranslations("Homepage.Hero");

  return (
    <section
      aria-labelledby="hero-heading"
      className="relative bg-gradient-to-b from-stone-50 to-white py-12 lg:py-20 overflow-hidden"
    >
      {/* Decorative blobs */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none" aria-hidden="true">
        <div className="absolute -top-32 -right-32 w-96 h-96 bg-amber-50 rounded-full blur-3xl opacity-50" />
        <div className="absolute -bottom-32 -left-32 w-96 h-96 bg-stone-100 rounded-full blur-3xl opacity-50" />
      </div>

      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col lg:flex-row gap-10 lg:gap-14 items-center">
          {/* ── Left Column ────────────────────────────── */}
          <div className="w-full lg:w-1/2 text-center lg:text-left">
            {/* Badge */}
            <div className="inline-flex items-center gap-2.5 bg-stone-900 text-white px-4 py-2 rounded-full text-xs font-bold uppercase tracking-widest mb-8 shadow-lg">
<Image src={"/public/flags/Flag_of_Burkina_Faso.svg"} alt={"badge"} fill className="object-cover" sizes="64px" />
              <span>{t("badge")}</span>
            </div>

            {/* Title */}
            <h1
              id="hero-heading"
              className="text-4xl lg:text-5xl xl:text-6xl font-bold font-serif text-stone-900 mb-4 leading-[1.15]"
            >
              {t("title")}
            </h1>

            {/* Subtitle */}
            <p className="text-lg text-stone-600 leading-relaxed mb-5 max-w-xl mx-auto lg:mx-0">
              {t("subtitle")}
            </p>

            {/* Decorative divider */}
            <div className="flex items-center  mb-8 justify-center lg:justify-start" aria-hidden="true">
              <span className="h-px w-12 " />
              <Image src={'/burkina_faso_flag_with_flagpole_256.png'} className="w-25 h-25" width={1000} height={1000} alt="drapeau du bukina faso" />
              <span className="h-px w-12 " />
            </div>

            {/* ── Time Cards (isolated re-renders) ────── */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 max-w-lg mx-auto lg:mx-0">
              <TimeCard
                flagSrc="/flags/Flag_of_India.svg"
                flagAlt={t("india_flag_alt")}
                city={t("india_city")}
                country={t("india_country")}
                timezone="Asia/Kolkata"
                localTimeLabel={t("local_time")}
              />
              <TimeCard
                flagSrc="/flags/Flag_of_Burkina_Faso.svg"
                flagAlt={t("bf_flag_alt")}
                city={t("bf_city")}
                country={t("bf_country")}
                timezone="Africa/Ouagadougou"
                localTimeLabel={t("local_time")}
              />
            </div>
          </div>

          {/* ── Right Column (Carousel) ───────────────── */}
          <div className="w-full lg:w-1/2 group">
            <ImageCarousel
              galleryLabel={t("carousel.label")}
              slideLabel={t("carousel.slide")}
              pauseLabel={t("carousel.pause")}
              playLabel={t("carousel.play")}
            />

            {/* Caption below carousel */}
            <p className="text-center text-xs text-stone-400 mt-3 uppercase tracking-widest font-medium">
              {t("carousel.caption")}
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}