"use client";

import { useId } from "react";
import { FaChevronDown } from "react-icons/fa";
import type { FaqItem } from "../types/about";

interface FaqAccordionItemProps {
  item: FaqItem;
  isOpen: boolean;
  onToggle: () => void;
}

export function FaqAccordionItem({
  item,
  isOpen,
  onToggle,
}: FaqAccordionItemProps) {
  const uid = useId();
  const headerId = `${uid}-header`;
  const panelId = `${uid}-panel`;

  return (
    <div className="bg-white rounded-xl border border-stone-200 overflow-hidden shadow-sm">
      <h3 id={headerId} className="m-0">
        <button
          aria-expanded={isOpen}
          aria-controls={panelId}
          onClick={onToggle}
          className={`
            w-full flex items-center justify-between gap-4
            p-6 text-left transition-colors duration-200
            hover:bg-stone-50
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-red-600 focus-visible:ring-inset
            rounded-xl
          `}
        >
          <span
            className={`
              text-lg font-bold font-serif leading-snug
              ${isOpen ? "text-red-700" : "text-stone-800"}
            `}
          >
            {item.question}
          </span>

          <FaChevronDown
            aria-hidden="true"
            className={`
              w-5 h-5 text-stone-400 flex-shrink-0
              transition-transform duration-300
              ${isOpen ? "rotate-180" : ""}
            `}
          />
        </button>
      </h3>

      {/* ✅ CSS Grid animation — smooth, no max-height hack */}
      <div
        id={panelId}
        role="region"
        aria-labelledby={headerId}
        className={`
          grid transition-[grid-template-rows] duration-300 ease-in-out
          ${isOpen ? "grid-rows-[1fr]" : "grid-rows-[0fr]"}
        `}
      >
        <div className="overflow-hidden">
          <div className="px-6 pb-6 border-t border-stone-100">
            <ul className="pt-4 space-y-3" role="list">
              {item.answers
                .filter((a) => a.trim() !== "")
                .map((answer, i) => (
                  <li
                    key={i}
                    className="flex items-start gap-3 text-stone-600 leading-relaxed"
                  >
                    <span
                      className="w-1.5 h-1.5 rounded-full bg-red-600 mt-2.5 flex-shrink-0"
                      aria-hidden="true"
                    />
                    <span>{answer}</span>
                  </li>
                ))}
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}