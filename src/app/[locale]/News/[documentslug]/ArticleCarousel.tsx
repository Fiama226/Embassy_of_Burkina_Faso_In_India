"use client";

import React, { useState, useEffect, useCallback, useRef } from "react";
import Image from "next/image";
import { FaChevronLeft, FaChevronRight, FaPause, FaPlay } from "react-icons/fa";

export interface CarouselImage {
  image: {
    url: string;
    alt?: string;
    width?: number;
    height?: number;
  };
  caption?: string;
}

export default function ArticleCarousel({
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

        {images[current]?.caption && (
          <div className="absolute bottom-0 inset-x-0 bg-gradient-to-t from-black/70 to-transparent px-6 pb-12 pt-16">
            <p className="text-white text-sm font-medium">
              {images[current].caption}
            </p>
          </div>
        )}

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
