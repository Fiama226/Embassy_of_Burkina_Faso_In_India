"use client";

import { useId } from "react";
import { FaChevronDown } from "react-icons/fa";
import type { IconType } from "react-icons";

interface AccordionItemProps {
  id: string;
  icon: IconType;
  title: string;
  gradient: string;
  isOpen: boolean;
  onToggle: () => void;
  children: React.ReactNode;
}

export function AccordionItem({
  icon: Icon,
  title,
  gradient,
  isOpen,
  onToggle,
  children,
}: AccordionItemProps) {
  const uid = useId();
  const headerId = `${uid}-header`;
  const panelId = `${uid}-panel`;

  return (
    <div className="bg-white rounded-2xl shadow-lg border border-slate-100 overflow-hidden">
      {/* ✅ Semantic h2 wrapping the button — proper heading hierarchy */}
      <h2 id={headerId} className="m-0">
        <button
          aria-expanded={isOpen}
          aria-controls={panelId}
          onClick={onToggle}
          className="
            w-full px-6 lg:px-8 py-6
            flex items-center justify-between
            hover:bg-slate-50 transition-colors duration-200
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-blue-600 focus-visible:ring-inset
            rounded-2xl
          "
        >
          <div className="flex items-center gap-4">
            <div
              className={`w-14 h-14 bg-gradient-to-br ${gradient} rounded-xl
                flex items-center justify-center shadow-lg`}
            >
              <Icon className="text-white text-2xl" aria-hidden="true" />
            </div>
            <span className="text-2xl lg:text-3xl font-bold font-serif text-slate-900 text-left">
              {title}
            </span>
          </div>

          <FaChevronDown
            aria-hidden="true"
            className={`
              text-slate-400 text-xl flex-shrink-0 ml-4
              transition-transform duration-300
              ${isOpen ? "rotate-180" : ""}
            `}
          />
        </button>
      </h2>

      {/* ✅ CSS Grid animation — smooth open/close, no max-height hack */}
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
          <div className="px-6 lg:px-8 pb-8 pt-8 border-t border-slate-100">
            {children}
          </div>
        </div>
      </div>
    </div>
  );
}