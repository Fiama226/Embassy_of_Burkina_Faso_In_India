"use client";

import { useTranslations } from "next-intl";
import {
  FaUserTie,
  FaUsers,
  FaUniversity,
  FaGlobeAsia,
  FaQuestionCircle,
} from "react-icons/fa";
import type {
  TabItem,
  TabId,
  StaffMember,
  ConsulateInfo,
  FaqItem,
} from "../types/about";
import { CONSULATES } from "./contactInfo";

export function useAboutData() {
  const t = useTranslations("AboutPage");

  // ── Tabs ─────────────────────────────────────────────────
  const tabs: TabItem[] = [
    { id: "ambassador", label: t("tabs.ambassador"), icon: FaUserTie },
    { id: "staff", label: t("tabs.staff"), icon: FaUsers },
    { id: "embassy", label: t("tabs.embassy"), icon: FaUniversity },
    { id: "network", label: t("tabs.network"), icon: FaGlobeAsia },
    { id: "faq", label: t("tabs.faq"), icon: FaQuestionCircle },
  ];

  // ── Staff ────────────────────────────────────────────────
  const staff: StaffMember[] = [
    {
      id: 1,
      name: t("staff.members.bado.name"),
      role: t("staff.members.bado.role"),
      image: "AimeYvesBADO.jpg",
      tier: "leadership",
    },
    {
      id: 2,
      name: t("staff.members.gagre.name"),
      role: t("staff.members.gagre.role"),
      image: "Jean_baptiste_GAGRE.png",
      tier: "diplomatic",
    },
    {
      id: 3,
      name: t("staff.members.ouedraogo.name"),
      role: t("staff.members.ouedraogo.role"),
      image: "OUEDRAOGO_Mahama.jpeg",
      tier: "diplomatic",
    },
    {
      id: 4,
      name: t("staff.members.coulibaly.name"),
      role: t("staff.members.coulibaly.role"),
      image: "Coulibaly_Herve.png",
      tier: "diplomatic",
    },
    {
      id: 5,
      name: t("staff.members.somadula.name"),
      role: t("staff.members.somadula.role"),
      image: "Somadula_Sangeeta.png",
      tier: "administrative",
    },
    {
      id: 6,
      name: t("staff.members.chander.name"),
      role: t("staff.members.chander.role"),
      image: "Chander_Subhash.png",
      tier: "administrative",
    },
    {
      id: 7,
      name: t("staff.members.sanjeev.name"),
      role: t("staff.members.sanjeev.role"),
      image: "Kumar_Sanjeev.png",
      tier: "support",
    },
    {
      id: 8,
      name: t("staff.members.kiran.name"),
      role: t("staff.members.kiran.role"),
      image: "Biswa_Kiran.png",
      tier: "support",
    },
    {
      id: 9,
      name: t("staff.members.rakesh.name"),
      role: t("staff.members.rakesh.role"),
      image: "Kumar_Rakesh.png",
      tier: "support",
    },
    {
      id: 10,
      name: t("staff.members.sukhdev.name"),
      role: t("staff.members.sukhdev.role"),
      image: "Singh_Sukhdev.png",
      tier: "support",
    },
  ];

  // ── Consular Network ─────────────────────────────────────
  const consulates: ConsulateInfo[] = [
    {
      id: "bangkok",
      title: t("network.bangkok_title"),
      country: t("network.bangkok_country"),
      flagSrc: CONSULATES.bangkok.flagSrc,
      address: CONSULATES.bangkok.address,
      phone: CONSULATES.bangkok.phone,
      consulName: CONSULATES.bangkok.consul,
      accent: "red",
    },
    {
      id: "jakarta",
      title: t("network.jakarta_title"),
      country: t("network.jakarta_country"),
      flagSrc: CONSULATES.jakarta.flagSrc,
      address: CONSULATES.jakarta.address,
      phone: CONSULATES.jakarta.phone,
      consulName: CONSULATES.jakarta.consul,
      accent: "green",
    },
  ];

  // ── FAQ ──────────────────────────────────────────────────
  const faqItems: FaqItem[] = Array.from({ length: 6 }, (_, i) => ({
    id: i + 1,
    question: t(`faq.items.q${i + 1}`),
    answers: t.raw(`faq.items.a${i + 1}`) as string[],
  }));

  return { tabs, staff, consulates, faqItems };
}