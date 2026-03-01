"use client";

import { useTranslations } from "next-intl";
import {
  FaHandshake,
  FaChartLine,
  FaUniversity,
  FaHospital,
  FaSeedling,
  FaExchangeAlt,
  FaAward,
  FaGraduationCap,
  FaFlask,
  FaMusic,
  FaTheaterMasks,
  FaUsers,
} from "react-icons/fa";
import type {
  Statistic,
  CooperationItem,
  SuccessStory,
  TabData,
} from "@/types/cooperation";

/**
 * Centralizes ALL data construction from translation keys.
 * No hardcoded strings. No `locale === "fr"` ternaries.
 */
export function useCooperationData() {
  const t = useTranslations("Cooperation");

  // ── Statistics ────────────────────────────────────────────
  const statistics: Statistic[] = [
    { value: t("stats.trade.value"), label: t("stats.trade.label"), icon: FaExchangeAlt },
    { value: t("stats.agreements.value"), label: t("stats.agreements.label"), icon: FaHandshake },
    { value: t("stats.companies.value"), label: t("stats.companies.label"), icon: FaChartLine },
    { value: t("stats.projects.value"), label: t("stats.projects.label"), icon: FaAward },
    { value: t("stats.scholars.value"), label: t("stats.scholars.label"), icon: FaGraduationCap },
    { value: t("stats.events.value"), label: t("stats.events.label"), icon: FaMusic },
  ];

  // ── Tab Content ───────────────────────────────────────────
  const economicItems: CooperationItem[] = [
    {
      id: 1,
      title: t("economic.trade.title"),
      description: t("economic.trade.description"),
      achievements: t.raw("economic.trade.achievements") as string[],
      stat: t("economic.trade.stat"),
      statLabel: t("economic.trade.stat_label"),
      icon: FaHandshake,
    },
    {
      id: 2,
      title: t("economic.infrastructure.title"),
      description: t("economic.infrastructure.description"),
      achievements: t.raw("economic.infrastructure.achievements") as string[],
      stat: t("economic.infrastructure.stat"),
      statLabel: t("economic.infrastructure.stat_label"),
      icon: FaChartLine,
    },
    {
      id: 3,
      title: t("economic.agriculture.title"),
      description: t("economic.agriculture.description"),
      achievements: t.raw("economic.agriculture.achievements") as string[],
      stat: t("economic.agriculture.stat"),
      statLabel: t("economic.agriculture.stat_label"),
      icon: FaSeedling,
    },
  ];

  const culturalItems: CooperationItem[] = [
    {
      id: 1,
      title: t("cultural.arts.title"),
      description: t("cultural.arts.description"),
      achievements: t.raw("cultural.arts.achievements") as string[],
      stat: t("cultural.arts.stat"),
      statLabel: t("cultural.arts.stat_label"),
      icon: FaTheaterMasks,
    },
    {
      id: 2,
      title: t("cultural.heritage.title"),
      description: t("cultural.heritage.description"),
      achievements: t.raw("cultural.heritage.achievements") as string[],
      stat: t("cultural.heritage.stat"),
      statLabel: t("cultural.heritage.stat_label"),
      icon: FaMusic,
    },
  ];

  const academicItems: CooperationItem[] = [
    {
      id: 1,
      title: t("academic.scholarships.title"),
      description: t("academic.scholarships.description"),
      achievements: t.raw("academic.scholarships.achievements") as string[],
      stat: t("academic.scholarships.stat"),
      statLabel: t("academic.scholarships.stat_label"),
      icon: FaGraduationCap,
    },
    {
      id: 2,
      title: t("academic.research.title"),
      description: t("academic.research.description"),
      achievements: t.raw("academic.research.achievements") as string[],
      stat: t("academic.research.stat"),
      statLabel: t("academic.research.stat_label"),
      icon: FaFlask,
    },
    {
      id: 3,
      title: t("academic.institutions.title"),
      description: t("academic.institutions.description"),
      achievements: t.raw("academic.institutions.achievements") as string[],
      stat: t("academic.institutions.stat"),
      statLabel: t("academic.institutions.stat_label"),
      icon: FaUniversity,
    },
  ];

  const socialItems: CooperationItem[] = [
    {
      id: 1,
      title: t("social.health.title"),
      description: t("social.health.description"),
      achievements: t.raw("social.health.achievements") as string[],
      stat: t("social.health.stat"),
      statLabel: t("social.health.stat_label"),
      icon: FaHospital,
    },
    {
      id: 2,
      title: t("social.community.title"),
      description: t("social.community.description"),
      achievements: t.raw("social.community.achievements") as string[],
      stat: t("social.community.stat"),
      statLabel: t("social.community.stat_label"),
      icon: FaUsers,
    },
  ];

  const tabs: TabData[] = [
    { id: "economic", label: t("tabs.economic"), items: economicItems },
    { id: "cultural", label: t("tabs.cultural"), items: culturalItems },
    { id: "academic", label: t("tabs.academic"), items: academicItems },
    { id: "social", label: t("tabs.social"), items: socialItems },
  ];

  const successStories: SuccessStory[] = [
    {
      id: 1,
      title: t("success_stories.items.irrigation.title"),
      impact: t("success_stories.items.irrigation.impact"),
      year: "2022",
      category: "economic",
      categoryLabel: t("tabs.economic"),
    },
    {
      id: 2,
      title: t("success_stories.items.it_center.title"),
      impact: t("success_stories.items.it_center.impact"),
      year: "2021",
      category: "academic",
      categoryLabel: t("tabs.academic"),
    },
    {
      id: 3,
      title: t("success_stories.items.health_clinic.title"),
      impact: t("success_stories.items.health_clinic.impact"),
      year: "2023",
      category: "social",
      categoryLabel: t("tabs.social"),
    },
  ];

  return { statistics, tabs, successStories };
}