"use client";

import { useState, useRef, useCallback, KeyboardEvent } from "react";
import { useTranslations } from "next-intl";
import { CooperationCard } from "./ui/CooperationCard";
import type { TabData, TabId } from "@/types/cooperation";

interface CooperationTabsProps {
  tabs: TabData[];
}

export function CooperationTabs({ tabs }: CooperationTabsProps) {
  const t = useTranslations("Cooperation");
  const [activeTab, setActiveTab] = useState<TabId>("economic");
  const tabRefs = useRef<Record<string, HTMLButtonElement | null>>({});

  const activeData = tabs.find((tab) => tab.id === activeTab)!;

  // ── Keyboard Navigation (Arrow keys between tabs — WAI-ARIA pattern) ──
  const handleKeyDown = useCallback(
    (e: KeyboardEvent<HTMLButtonElement>) => {
      const tabIds = tabs.map((t) => t.id);
      const currentIndex = tabIds.indexOf(activeTab);
      let nextIndex: number | null = null;

      if (e.key === "ArrowRight" || e.key === "ArrowDown") {
        e.preventDefault();
        nextIndex = (currentIndex + 1) % tabIds.length;
      } else if (e.key === "ArrowLeft" || e.key === "ArrowUp") {
        e.preventDefault();
        nextIndex = (currentIndex - 1 + tabIds.length) % tabIds.length;
      } else if (e.key === "Home") {
        e.preventDefault();
        nextIndex = 0;
      } else if (e.key === "End") {
        e.preventDefault();
        nextIndex = tabIds.length - 1;
      }

      if (nextIndex !== null) {
        const nextId = tabIds[nextIndex];
        setActiveTab(nextId);
        tabRefs.current[nextId]?.focus();
      }
    },
    [activeTab, tabs]
  );

  return (
    <>
      {/* ✅ Sticky Tab Bar with proper ARIA */}
      <div className="sticky top-0 z-40 bg-white/95 backdrop-blur-md border-b border-stone-200 shadow-sm">
        <nav className="max-w-7xl mx-auto px-4">
          <div
            role="tablist"
            aria-label={t("tabs.label")}
            className="flex justify-center gap-1 py-3 overflow-x-auto"
          >
            {tabs.map((tab) => {
              const isActive = activeTab === tab.id;
              return (
                <button
                  key={tab.id}
                  ref={(el) => {
                    tabRefs.current[tab.id] = el;
                  }}
                  role="tab"
                  id={`tab-${tab.id}`}
                  aria-selected={isActive}
                  aria-controls={`panel-${tab.id}`}
                  tabIndex={isActive ? 0 : -1}
                  onClick={() => setActiveTab(tab.id)}
                  onKeyDown={handleKeyDown}
                  className={`
                    px-5 py-2.5 rounded-lg font-medium text-sm
                    tracking-wide transition-all duration-200
                    whitespace-nowrap
                    focus-visible:outline-none focus-visible:ring-2
                    focus-visible:ring-amber-500 focus-visible:ring-offset-2
                    ${
                      isActive
                        ? "bg-stone-900 text-amber-50 shadow-md"
                        : "bg-transparent text-stone-600 hover:bg-stone-100 hover:text-stone-900"
                    }
                  `}
                >
                  {tab.label}
                </button>
              );
            })}
          </div>
        </nav>
      </div>

      {/* ✅ Tab Panel */}
      <section className="py-20 px-4 max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <h2 className="text-3xl md:text-4xl font-serif font-bold text-stone-900">
            {activeData.label}
          </h2>
          <div
            className="h-1 w-16 bg-red-700 mx-auto mt-4 mb-2"
            aria-hidden="true"
          />
        </div>

        <div
          role="tabpanel"
          id={`panel-${activeTab}`}
          aria-labelledby={`tab-${activeTab}`}
          tabIndex={0}
          className="focus-visible:outline-none"
        >
          <div
            className={`
              grid gap-8
              ${activeData.items.length === 2 ? "md:grid-cols-2" : "md:grid-cols-2 lg:grid-cols-3"}
            `}
          >
            {activeData.items.map((item) => (
              <CooperationCard
                key={item.id}
                item={item}
                achievementsLabel={t("achievements_label")}
              />
            ))}
          </div>

          {/* Empty state — should never appear but safe fallback */}
          {activeData.items.length === 0 && (
            <p className="text-center text-stone-500 py-12">
              {t("no_data")}
            </p>
          )}
        </div>
      </section>
    </>
  );
}