import { useTranslations } from "next-intl";
import { StatCard } from "./ui/StatCard";
import type { Statistic } from "@/types/cooperation";

interface CooperationHeroProps {
  statistics: Statistic[];
}

export function CooperationHero({ statistics }: CooperationHeroProps) {
  const t = useTranslations("Cooperation");

  return (
    <section
      aria-labelledby="hero-heading"
      className="relative bg-white pt-24 pb-20 border-b border-stone-200"
    >
      {/* National colors accent bar */}
      <div
        className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-red-600 via-amber-500 to-green-600"
        aria-hidden="true"
      />

      <div className="max-w-7xl mx-auto px-4 text-center">
        {/* Title */}
        <div className="inline-block mb-6">
          <h1
            id="hero-heading"
            className="text-4xl md:text-6xl font-serif font-bold text-stone-900 mb-2"
          >
            {t("hero.title")}
          </h1>
          <div
            className="h-1.5 w-24 mx-auto bg-amber-500 rounded-full mt-4"
            aria-hidden="true"
          />
        </div>

        <p className="text-xl md:text-2xl max-w-3xl mx-auto mb-12 text-stone-600 leading-relaxed">
          {t("hero.subtitle")}
        </p>

        {/* Stats Grid */}
        <div
          className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4 lg:gap-6 mt-10"
          role="list"
          aria-label={t("hero.stats_label")}
        >
          {statistics.map((stat, i) => (
            <div key={i} role="listitem">
              <StatCard stat={stat} />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}