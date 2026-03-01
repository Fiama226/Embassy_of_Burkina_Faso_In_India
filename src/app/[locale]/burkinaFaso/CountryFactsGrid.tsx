import type { CountryFact } from "@/types/burkina";
import { CountryFactCard } from "./CountryFactCard";

interface CountryFactsGridProps {
  facts: CountryFact[];
  title: string;
  description: string;
}

export function CountryFactsGrid({
  facts,
  title,
  description,
}: CountryFactsGridProps) {
  return (
    <section aria-labelledby="facts-heading" className="mb-16">
      {/* Section header */}
      <header className="text-center mb-10">
        <h2
          id="facts-heading"
          className="text-3xl font-serif font-bold text-stone-800 mb-4"
        >
          {title}
        </h2>
        <div className="h-0.5 w-24 bg-red-700 mx-auto mb-6" aria-hidden="true" />
        <p className="text-stone-600 max-w-2xl mx-auto leading-relaxed">
          {description}
        </p>
      </header>

      {/* ✅ Grid: 2 cols → 3 cols → 5 cols
          10 items: 5+5 on xl, 3+3+3+1 on lg (see note below), 2+2+... on sm
          We use auto-fill to let the last row center naturally */}
      <div className="max-w-7xl mx-auto px-4">
        <div
          className="
            grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5
            gap-6
          "
        >
          {facts.map((fact) => (
            <CountryFactCard key={fact.id} fact={fact} />
          ))}
        </div>

        {/* ✅ Alternative: if you want the last row centered on lg (3-col),
            use flexbox instead:
            className="flex flex-wrap justify-center gap-6"
            with cards having className="w-full sm:w-[calc(50%-12px)] lg:w-[calc(33.333%-16px)] xl:w-[calc(20%-20px)]"
        */}
      </div>
    </section>
  );
}