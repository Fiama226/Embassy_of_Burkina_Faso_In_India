"use client";

import { CooperationHero } from "./CooperationHero";
import { CooperationIntro } from "./CooperationIntro";
import { CooperationTabs } from "./CooperationTabs";
import { SuccessStories } from "./SuccessStories";
import { CooperationCTA } from "./CooperationCTA";
import { useCooperationData } from "./data/useCooperationData";

export default function CooperationPage() {
  const { statistics, tabs, successStories } = useCooperationData();

  return (
    <main className="min-h-screen bg-stone-50 text-stone-800">
      <CooperationHero statistics={statistics} />
      <CooperationIntro />
      <CooperationTabs tabs={tabs} />
      <SuccessStories stories={successStories} />
      <CooperationCTA />
    </main>
  );
}