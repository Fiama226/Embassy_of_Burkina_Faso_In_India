import Image from "next/image";
import type { CountryFact } from "@/types/burkina";

interface CountryFactCardProps {
  fact: CountryFact;
}

export function CountryFactCard({ fact }: CountryFactCardProps) {
  return (
    <article className="group relative bg-white rounded-xl shadow-sm border border-stone-200 overflow-hidden transition-shadow duration-300 hover:shadow-lg focus-within:shadow-lg">
      {/* Left accent bar */}
      <div
        className="absolute top-0 left-0 w-1 h-full bg-red-700 opacity-0 group-hover:opacity-100 group-focus-within:opacity-100 transition-opacity duration-300"
        aria-hidden="true"
      />

      <div className="p-6 flex flex-col items-center text-center h-full">
        {/* Icon */}
        <div className="mb-4 p-3 rounded-full bg-stone-50 group-hover:bg-amber-50 transition-colors duration-300 border border-stone-100">
          <div className="relative w-14 h-14">
            <Image
              src={fact.icon}
              alt="" // Decorative — title below provides context
              fill
              className="object-contain"
              sizes="56px"
              loading="lazy"
            />
          </div>
        </div>

        {/* Title */}
        <h3 className="text-lg font-serif font-bold text-stone-900 mb-2">
          {fact.title}
        </h3>

        {/* Value */}
        <p className="text-stone-600 font-medium flex-grow text-sm leading-relaxed">
          {fact.value}
        </p>
      </div>
    </article>
  );
}