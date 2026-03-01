import { useTranslations } from "next-intl";
import { StoryCard } from "./ui/StoryCard";
import type { SuccessStory } from "@/types/cooperation";

interface SuccessStoriesProps {
  stories: SuccessStory[];
}

export function SuccessStories({ stories }: SuccessStoriesProps) {
  const t = useTranslations("Cooperation");

  return (
    <section
      aria-labelledby="stories-heading"
      className="py-20 bg-white border-t border-stone-200"
    >
      <div className="max-w-7xl mx-auto px-4">
        <header className="text-center mb-16">
          <h2
            id="stories-heading"
            className="text-3xl font-serif font-bold text-stone-900 mb-3"
          >
            {t("success_stories.title")}
          </h2>
          <p className="text-lg text-stone-500 max-w-2xl mx-auto leading-relaxed">
            {t("success_stories.subtitle")}
          </p>
        </header>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {stories.map((story) => (
            <StoryCard key={story.id} story={story} />
          ))}
        </div>
      </div>
    </section>
  );
}