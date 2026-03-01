// ============================================
// File: components/Footer/index.tsx (Server Component - Entry Point)
// ============================================

import { getTranslations } from "next-intl/server";
import { FooterContent } from "./FooterContent";
import { NewsletterForm } from "./NewsletterForm";

// Design tokens - should be in tailwind.config.js
// Shown here for reference
const BURKINA_COLORS = {
  red: "#EF2D2D",
  yellow: "#FCD116", 
  green: "#009E49",
} as const;

export default async function Footer() {
  const t = await getTranslations("layout");

  // Static data prepared on server
  const governmentLinks = [
    {
      name: t("footer.PF"),
      link: "https://www.presidencedufaso.bf/",
      iconType: "flag" as const,
    },
    {
      name: t("footer.P"),
      link: "https://gouvernement.gov.bf/",
      iconType: "landmark" as const,
    },
    {
      name: t("footer.MAE"),
      link: "http://mae.gov.bf/accueil",
      iconType: "globe" as const,
    },
    {
      name: t("footer.ALT"),
      link: "http://assembleenationale.bf/",
      iconType: "gavel" as const,
    },
    {
      name: t("footer.ONTB"),
      link: "http://ontb.bf/",
      iconType: "passport" as const,
    },
  ];

  const services = [
    { name: t("footer.LV"), hours: t("footer.NF"), iconType: "clock" as const },
    { name: t("footer.SD"), hours: t("footer.F"), iconType: "passport" as const },
    { name: t("footer.JfIBF"), hours: t("footer.F"), iconType: "calendar" as const },
  ];

  const socialMediaLinks = [
    { name: t("social.Facebook"), link: "#", platform: "facebook" as const },
    { name: t("social.Twitter"), link: "#", platform: "twitter" as const },
    { name: t("social.Instagram"), link: "#", platform: "instagram" as const },
    { name: t("social.LinkedIn"), link: "#", platform: "linkedin" as const },
  ];

  const translations = {
    emergencyTitle: t("footer.emergencyTitle"),
    emergencySubtitle: t("footer.emergencySubtitle"),
    callNow: t("footer.callNow"),
    embassyName: t("footer.EBI"),
    location: t("footer.location"),
    description: t("footer.description"),
    followUs: t("footer.followUs"),
    officialLinks: t("footer.LU"),
    services: t("footer.S"),
    contactUs: t("footer.NC"),
    addressLine1: t("footer.addressLine1"),
    addressLine2: t("footer.addressLine2"),
    phoneStandard: t("footer.phoneStandard"),
    phoneLabelStandard: t("footer.phoneLabelStandard"),
    emailAddress: t("footer.emailAddress"),
    emailLabelMain: t("footer.emailLabelMain"),
    newsletterTitle: t("footer.newsletterTitle"),
    copyright: t("footer.copyright"),
    diplomaticSince: t("footer.diplomaticSince"),
    privacy: t("footer.privacy"),
    terms: t("footer.terms"),
    cookies: t("footer.cookies"),
    accessibility: t("footer.accessibility"),
    sitemap: t("footer.sitemap"),
    opensInNewTab:"Opens in new tab",
  };

  return (
    <FooterContent
      governmentLinks={governmentLinks}
      services={services}
      socialMediaLinks={socialMediaLinks}
      translations={translations}
    />
  );
}