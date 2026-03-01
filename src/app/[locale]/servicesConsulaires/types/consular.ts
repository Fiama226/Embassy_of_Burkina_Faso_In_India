import type { IconType } from "react-icons";

export interface ServiceSection {
  id: string;
  icon: IconType;
  title: string;
  gradient: string;
}

export type AccentColor = "emerald" | "blue" | "violet" | "amber";

export interface VisaFee {
  duration: string;
  price: string;
}

export interface DocumentRequirement {
  title: string;
  docs: string[];
}