import { FaAward, FaUsers } from "react-icons/fa";
import type { SuccessStory } from "@/types/cooperation";

interface StoryCardProps {
  story: SuccessStory;
}

export function StoryCard({ story }: StoryCardProps) {
  return (
    <article
      className="
        bg-stone-50 rounded-xl p-6 border border-stone-200
        hover:border-amber-400/50 transition-colors
      "
    >
      {/* Meta row */}
      <div className="flex justify-between items-start mb-4">
        <div className="flex items-center gap-2">
          <span className="bg-stone-200 text-stone-700 px-2.5 py-1 rounded text-xs font-bold tabular-nums">
            {story.year}
          </span>
          <span className="text-xs uppercase tracking-widest text-amber-600 font-semibold">
            {story.categoryLabel}
          </span>
        </div>
        <FaAward className="text-stone-300 text-xl" aria-hidden="true" />
      </div>

      {/* Title */}
      <h3 className="text-lg font-bold text-stone-900 mb-2 font-serif">
        {story.title}
      </h3>

      {/* Impact */}
      <div className="mt-4 pt-4 border-t border-stone-200 flex items-center text-sm font-medium text-stone-700">
        <FaUsers className="mr-2 text-stone-400" aria-hidden="true" />
        <span>{story.impact}</span>
      </div>
    </article>
  );
}