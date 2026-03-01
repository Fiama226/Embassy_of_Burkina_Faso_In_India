import type { IconType } from "react-icons";

export type TabId =
  | "ambassador"
  | "staff"
  | "embassy"
  | "network"
  | "faq";

export interface TabItem {
  id: TabId;
  label: string;
  icon: IconType;
}

export interface StaffMember {
  id: number;
  name: string;
  role: string;
  image: string;
  tier: "leadership" | "diplomatic" | "administrative" | "support";
}

export interface ConsulateInfo {
  id: string;
  title: string;
  country: string;
  flagSrc: string;
  address: string;
  phone: string;
  consulName: string;
  accent: "red" | "green";
}

export interface FaqItem {
  id: number;
  question: string;
  answers: string[];
}