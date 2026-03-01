"use client";

import React, { useState, useCallback, useRef } from "react";
import { useTranslations } from "next-intl";
import { FaPassport, FaIdCard, FaPlane, FaFileAlt } from "react-icons/fa";

import { ConsularHeader } from "./ConsularHeader";
import { QuickNav } from "./QuickNav";
import { AccordionItem } from "./AccordionItem";
import { PassportSection } from "./sections/PassportSection";
import { ConsularCardSection } from "./sections/ConsularCardSection";
import { VisaSection } from "./sections/VisaSection";
import { MiscSection } from "./sections/MiscSection";
import type { ServiceSection } from "./types/consular";

/** Map section IDs → their content components (avoids a switch/if chain) */
const SECTION_CONTENT: Record<string, React.ReactNode> = {
  passport: <PassportSection />,
  consular: <ConsularCardSection />,
  visa: <VisaSection />,
  misc: <MiscSection />,
};

export default function ConsularPage() {
  const t = useTranslations("Consular");
  const [activeSection, setActiveSection] = useState<string | null>(null);
  const sectionRefs = useRef<Record<string, HTMLDivElement | null>>({});

  const sections: ServiceSection[] = [
    {
      id: "passport",
      icon: FaPassport,
      title: t("passport.header"),
      gradient: "from-rose-600 to-rose-700",
    },
    {
      id: "consular",
      icon: FaIdCard,
      title: t("consular_card.header"),
      gradient: "from-emerald-600 to-emerald-700",
    },
    {
      id: "visa",
      icon: FaPlane,
      title: t("visa.header"),
      gradient: "from-blue-600 to-blue-700",
    },
    {
      id: "misc",
      icon: FaFileAlt,
      title: t("miscellaneous.header"),
      gradient: "from-slate-600 to-slate-700",
    },
  ];

  // ── Handlers ──────────────────────────────────────────────
  const handleToggle = useCallback((id: string) => {
    setActiveSection((prev) => (prev === id ? null : id));
  }, []);

  const handleNavigate = useCallback((id: string) => {
    setActiveSection(id);
    // Wait for the accordion to open, then scroll
    requestAnimationFrame(() => {
      sectionRefs.current[id]?.scrollIntoView({
        behavior: "smooth",
        block: "start",
      });
    });
  }, []);

  // ── Render ────────────────────────────────────────────────
  return (
    <main className="relative bg-transparent min-h-screen py-16 lg:py-24">
      {/* Decorative blobs — invisible to screen readers */}
      <div
        className="absolute inset-0 bg-gradient-to-b from-slate-50 via-white to-slate-50 overflow-hidden pointer-events-none"
        aria-hidden="true"
      >
        <div className="absolute -top-48 -right-48 w-96 h-96 bg-gradient-to-br from-rose-50 to-amber-50 rounded-full blur-3xl opacity-40" />
        <div className="absolute -bottom-48 -left-48 w-96 h-96 bg-gradient-to-br from-emerald-50 to-blue-50 rounded-full blur-3xl opacity-40" />
      </div>

      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Page Header */}
        <ConsularHeader
          title={t("title")}
          subtitle={t("subtitle")}
          badge={t("badge")}
        />

        {/* Quick-jump navigation */}
        <QuickNav
          sections={sections}
          activeSection={activeSection}
          onNavigate={handleNavigate}
        />

        {/* Accordion Sections */}
        <div
          className="space-y-6"
          role="region"
          aria-label={t("services_label")}
        >
          {sections.map((section) => (
            <div
              key={section.id}
              ref={(el) => {
                sectionRefs.current[section.id] = el;
              }}
              className="scroll-mt-24" // offset for sticky headers
            >
              <AccordionItem
                id={section.id}
                icon={section.icon}
                title={section.title}
                gradient={section.gradient}
                isOpen={activeSection === section.id}
                onToggle={() => handleToggle(section.id)}
              >
                {SECTION_CONTENT[section.id]}
              </AccordionItem>
            </div>
          ))}
        </div>

        {/* Footer */}
        <footer className="mt-16 text-center">
          <div className="inline-flex items-center gap-3 text-slate-500 text-sm">
            <span
              className="h-px w-12 bg-gradient-to-r from-transparent to-slate-300"
              aria-hidden="true"
            />
            <span>{t("footer_text")}</span>
            <span
              className="h-px w-12 bg-gradient-to-l from-transparent to-slate-300"
              aria-hidden="true"
            />
          </div>
        </footer>
      </div>
    </main>
  );
}