"use client";

import { useState, useCallback } from "react";
import { useTranslations } from "next-intl";
import { FaqAccordionItem } from "../ui/FaqAccordionItem";
import type { FaqItem } from "../types/about";

interface FaqSectionProps {
  items: FaqItem[];
}

export function FaqSection({ items }: FaqSectionProps) {
  const t = useTranslations("AboutPage.faq");
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  const handleToggle = useCallback((index: number) => {
    setOpenIndex((prev) => (prev === index ? null : index));
  }, []);

  return (
    <div className="max-w-4xl mx-auto">
      <header className="text-center mb-10">
        <h2 className="text-3xl lg:text-4xl font-serif font-bold text-stone-900 mb-4">
          {t("title")}
        </h2>
        <div
          className="h-1 w-24 bg-red-600 mx-auto rounded-full"
          aria-hidden="true"
        />
        <p className="text-stone-600 mt-4 leading-relaxed">
          {t("subtitle")}
        </p>
      </header>

      <div className="space-y-4">
        {items.map((item, idx) => (
          <FaqAccordionItem
            key={item.id}
            item={item}
            isOpen={openIndex === idx}
            onToggle={() => handleToggle(idx)}
          />
        ))}
      </div>
    </div>
  );
}