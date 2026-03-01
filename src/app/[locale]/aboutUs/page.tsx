"use client";

import { useState, useCallback } from "react";
import { AboutSidebar } from "./AboutSidebar";
import { AmbassadorSection } from "./sections/AmbassadorSection";
import { StaffSection } from "./sections/StaffSection";
import { EmbassySection } from "./sections/EmbassySection";
import { ConsularNetworkSection } from "./sections/ConsularNetworkSection";
import { FaqSection } from "./sections/FaqSection";
import { useAboutData } from "./data/useAboutData";
import type { TabId } from "./types/about";

export default function AboutPage() {
  const { tabs, staff, consulates, faqItems } = useAboutData();
  const [activeTab, setActiveTab] = useState<TabId>("ambassador");

  const handleTabChange = useCallback((id: TabId) => {
    setActiveTab(id);
    // Scroll to top of content on mobile
    if (window.innerWidth < 1024) {
      document
        .getElementById("about-content")
        ?.scrollIntoView({ behavior: "smooth" });
    }
  }, []);

  return (
    <main className="min-h-screen bg-stone-50 py-12 lg:py-20">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col lg:flex-row gap-8 lg:gap-12">
          {/* Sidebar */}
          <AboutSidebar
            tabs={tabs}
            activeTab={activeTab}
            onTabChange={handleTabChange}
          />

          {/* Content Panel */}
          <div
            id="about-content"
            className="w-full lg:w-3/4 scroll-mt-8"
            role="tabpanel"
            aria-labelledby={`sidebar-tab-${activeTab}`}
            tabIndex={0}
          >
            {activeTab === "ambassador" && <AmbassadorSection />}
            {activeTab === "staff" && <StaffSection staff={staff} />}
            {activeTab === "embassy" && <EmbassySection />}
            {activeTab === "network" && (
              <ConsularNetworkSection consulates={consulates} />
            )}
            {activeTab === "faq" && <FaqSection items={faqItems} />}
          </div>
        </div>
      </div>
    </main>
  );
}