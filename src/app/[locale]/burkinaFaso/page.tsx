"use client";

import { useTranslations } from "next-intl";
import { BurkinaHero } from "./BurkinaHero";
import { CountryFactsGrid } from "./CountryFactsGrid";
import { BilateralSection } from "./BilateralSection";
import type { CountryFact } from "@/types/burkina";

export default function BurkinaInfoPage() {
  const t = useTranslations("BurkinaPage");

  // ✅ All text from translations — no hardcoded strings
  const facts: CountryFact[] = [
    {
      id: 1,
      title: t("cards.capital.title"),
      value: t("cards.capital.value"),
      icon: "/icons/Capitale.webp",
    },
    {
      id: 2,
      title: t("cards.population.title"),
      value: t("cards.population.value"),
      icon: "/icons/people-together.webp",
    },
    {
      id: 3,
      title: t("cards.languages.title"),
      value: t("cards.languages.value"),
      icon: "/icons/conversation.webp",
    },
    {
      id: 4,
      title: t("cards.calling_code.title"),
      value: t("cards.calling_code.value"),
      icon: "/icons/code_country.webp",
    },
    {
      id: 5,
      title: t("cards.climate.title"),
      value: t("cards.climate.value"),
      icon: "/icons/cloudy.webp",
    },
    {
      id: 6,
      title: t("cards.flag.title"),
      value: t("cards.flag.value"),
      icon: "/icons/burkina-faso.webp",
    },
    {
      id: 7,
      title: t("cards.timezone.title"),
      value: t("cards.timezone.value"),
      icon: "/icons/time-zone.webp",
    },
    {
      id: 8,
      title: t("cards.currency.title"),
      value: t("cards.currency.value"),
      icon: "/icons/money.webp",
    },
    {
      id: 9,
      title: t("cards.president.title"),
      value: t("cards.president.value"),
      icon: "/icons/president.jpg",
    },
    {
      id: 10,
      title: t("cards.prime_minister.title"),
      value: t("cards.prime_minister.value"),
      icon: "/icons/premierMinistre.jpg",
    },
  ];

  return (
    <main className="min-h-screen bg-stone-50 py-12">
      <div className="max-w-7xl mx-auto px-4">
        {/* Hero */}
        <BurkinaHero />

        {/* Country Facts Grid */}
        <CountryFactsGrid
          facts={facts}
          title={t("national_info.section_title")}
          description={t("national_info.section_desc")}
        />

        {/* Bilateral Relations */}
        <BilateralSection
          title={t("national_info.bilateral_title")}
          text={t("national_info.bilateral_text")}
        />
      </div>
    </main>
  );
}