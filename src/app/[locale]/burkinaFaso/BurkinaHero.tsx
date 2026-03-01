"use client";

import { useTranslations } from "next-intl";
import { TypewriterText } from "./TypewriterText";

export function BurkinaHero() {
  const t = useTranslations("BurkinaPage");

  const phrases = t.raw("hero.typewriter") as string[];

  return (
    <header className="text-center mb-16">
      {/* Country name */}
      <div className="inline-block mb-8">
        <h1 className="text-5xl lg:text-7xl font-serif font-bold text-stone-900 mb-2">
          {t("hero.country_name")}
        </h1>
        <div
          className="h-1.5 w-1/2 mx-auto bg-amber-500 rounded-full mt-2"
          aria-hidden="true"
        />
      </div>

      {/* Typewriter */}
      <div className="max-w-4xl mx-auto mb-10">
        <div className="min-h-[100px] flex items-center justify-center">
          <TypewriterText
            phrases={phrases}
            fallback={phrases[0]}
            delay={1000}
            className="
              text-xl sm:text-2xl lg:text-3xl
              font-medium font-serif text-stone-700
              leading-relaxed
            "
          />
        </div>
      </div>

      {/* Intro paragraph */}
      <div className="max-w-3xl mx-auto">
        <p className="text-lg text-stone-600 leading-relaxed">
          {t("hero.intro")}
        </p>
      </div>
    </header>
  );
}