"use client";

import { useEffect, useRef, useState } from "react";
import { TypeAnimation } from "react-type-animation";

interface TypewriterTextProps {
  /** Full list of phrases to cycle through */
  phrases: string[];
  /** Fallback shown to screen readers and before hydration */
  fallback: string;
  /** Delay between phrases in ms */
  delay?: number;
  className?: string;
}

/**
 * Wraps react-type-animation with:
 * - A static fallback rendered on the server (avoids hydration mismatch)
 * - An aria-live region so screen readers announce each phrase
 * - A visually-hidden static text for users who prefer reduced motion
 */
export function TypewriterText({
  phrases,
  fallback,
  delay = 1000,
  className = "",
}: TypewriterTextProps) {
  const [mounted, setMounted] = useState(false);
  const [currentPhrase, setCurrentPhrase] = useState(fallback);
  const prefersReducedMotion = useRef(false);

  useEffect(() => {
    prefersReducedMotion.current = window.matchMedia(
      "(prefers-reduced-motion: reduce)"
    ).matches;
    setMounted(true);
  }, []);

  // Build the TypeAnimation sequence
  const sequence = phrases.flatMap((phrase) => [
    () => setCurrentPhrase(phrase), // update the live region
    phrase,
    delay,
  ]);

  // Before hydration or if user prefers reduced motion → show static text
  if (!mounted || prefersReducedMotion.current) {
    return (
      <p className={className} role="status">
        {fallback}
      </p>
    );
  }

  return (
    <div className="relative">
      {/* ✅ Screen reader–friendly live region (visually hidden) */}
      <p className="sr-only" role="status" aria-live="polite" aria-atomic="true">
        {currentPhrase}
      </p>

      {/* Visual typewriter (hidden from screen readers to avoid double reading) */}
      <div aria-hidden="true">
        <TypeAnimation
          sequence={sequence}
          speed={50}
          className={className}
          repeat={Infinity}
          cursor
        />
      </div>
    </div>
  );
}