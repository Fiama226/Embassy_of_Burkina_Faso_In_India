import type { IconType } from "react-icons";

export interface Statistic {
  value: string;
  label: string;
  icon: IconType;
}

export interface CooperationItem {
  id: number;
  title: string;
  description: string;
  achievements: string[];
  stat: string;
  statLabel: string;
  icon: IconType;
}

export interface SuccessStory {
  id: number;
  title: string;
  impact: string;
  year: string;
  category: string;
  categoryLabel: string;
}

export type TabId = "economic" | "cultural" | "academic" | "social";

export interface TabData {
  id: TabId;
  label: string;
  items: CooperationItem[];
}