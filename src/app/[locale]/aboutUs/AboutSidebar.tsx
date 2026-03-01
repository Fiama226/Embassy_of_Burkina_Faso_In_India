"use client";

import { useTranslations } from "next-intl";
import type { TabItem, TabId } from "./types/about";

interface AboutSidebarProps {
  tabs: TabItem[];
  activeTab: TabId;
  onTabChange: (id: TabId) => void;
}

export function AboutSidebar({
  tabs,
  activeTab,
  onTabChange,
}: AboutSidebarProps) {
  const t = useTranslations("AboutPage");

  return (
    <aside className="w-full lg:w-1/4">
      <div className="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden sticky top-24">
        {/* Header */}
        <div className="p-6 bg-stone-900">
          <h2 className="text-white font-serif font-bold text-xl">
            {t("sidebar.title")}
          </h2>
          <p className="text-stone-400 text-sm mt-1">
            {t("sidebar.subtitle")}
          </p>
        </div>

        {/* Tab List */}
        <nav aria-label={t("sidebar.nav_label")}>
          <div role="tablist" aria-orientation="vertical" className="p-2 space-y-1">
            {tabs.map((tab) => {
              const Icon = tab.icon;
              const isActive = activeTab === tab.id;

              return (
                <button
                  key={tab.id}
                  role="tab"
                  id={`sidebar-tab-${tab.id}`}
                  aria-selected={isActive}
                  aria-controls={`panel-${tab.id}`}
                  onClick={() => onTabChange(tab.id)}
                  className={`
                    w-full flex items-center gap-4 px-4 py-4
                    rounded-xl text-left transition-all duration-200
                    focus-visible:outline-none focus-visible:ring-2
                    focus-visible:ring-red-600 focus-visible:ring-inset
                    ${
                      isActive
                        ? "bg-red-50 text-red-900 shadow-sm ring-1 ring-red-100"
                        : "text-stone-600 hover:bg-stone-50 hover:text-stone-900"
                    }
                  `}
                >
                  <Icon
                    className={`w-5 h-5 flex-shrink-0 ${
                      isActive ? "text-red-700" : "text-stone-400"
                    }`}
                    aria-hidden="true"
                  />
                  <span
                    className={`font-medium ${isActive ? "font-bold" : ""}`}
                  >
                    {tab.label}
                  </span>
                  {isActive && (
                    <div
                      className="ml-auto w-1.5 h-1.5 rounded-full bg-red-600"
                      aria-hidden="true"
                    />
                  )}
                </button>
              );
            })}
          </div>
        </nav>
      </div>
    </aside>
  );
}