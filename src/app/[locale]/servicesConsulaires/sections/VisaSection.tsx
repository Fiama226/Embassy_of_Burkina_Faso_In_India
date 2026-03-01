"use client";

import { useTranslations } from "next-intl";
import { FaCheckCircle } from "react-icons/fa";
import { DocumentDownloadCard } from "../ui/DocumentDownloadCard";
import { VisaFeesTable } from "../ui/VisaFeesTable";
import { ACCENT_STYLES } from "../components/consular/constants";
import type { AccentColor } from "../types/consular";

export function VisaSection() {
  const t = useTranslations("Consular");

  const visaCategories: {
    label: string;
    docs: string[];
    accent: AccentColor;
  }[] = [
    {
      label: t("visa.cat_diplomatic"),
      docs: t.raw("visa.diplomatic_docs") as string[],
      accent: "emerald",
    },
    {
      label: t("visa.cat_business"),
      docs: t.raw("visa.business_docs") as string[],
      accent: "blue",
    },
    {
      label: t("visa.cat_conference"),
      docs: t.raw("visa.conference_docs") as string[],
      accent: "violet",
    },
    {
      label: t("visa.cat_tourism"),
      docs: t.raw("visa.tourism_docs") as string[],
      accent: "amber",
    },
  ];

  const businessFees = [
    { duration: t("visa.fees.3m_single"), price: "5,625 ₹" },
    { duration: t("visa.fees.3m_multi"), price: "7,500 ₹" },
    { duration: t("visa.fees.6m_single"), price: "6,500 ₹" },
    { duration: t("visa.fees.6m_multi"), price: "8,000 ₹" },
    { duration: t("visa.fees.12m_single"), price: "8,500 ₹" },
    { duration: t("visa.fees.12m_multi"), price: "9,800 ₹" },
  ];

  return (
    <div className="">
              <h3 className="text-2xl font-bold text-slate-900">
          {t("visa.required_docs")}
        </h3>
      {/* Left Column — Requirements & Fees */}
      <div className="space-y-6 grid lg:grid-cols-2 gap-10">


        {/* ✅ Accent styles resolved from a static map — no broken Tailwind */}
        {visaCategories.map((cat, idx) => {
          const styles = ACCENT_STYLES[cat.accent];
          return (
            <div
              key={idx}
              className={`${styles.bg} rounded-xl p-6 border ${styles.border}`}
            >
              <h4 className="font-bold text-lg text-slate-900 mb-4 flex items-center gap-3">
                <span
                  className={`w-8 h-8 ${styles.badge} rounded-lg flex items-center
                    justify-center text-white text-sm font-bold`}
                  aria-hidden="true"
                >
                  {idx + 1}
                </span>
                {cat.label}
              </h4>
              <ul className="grid sm:grid-cols-2 gap-2" role="list">
                {cat.docs.map((doc, i) => (
                  <li
                    key={i}
                    className="flex items-center gap-2 text-slate-700 text-sm"
                  >
                    <FaCheckCircle
                      className="text-emerald-500 flex-shrink-0 w-3.5 h-3.5"
                      aria-hidden="true"
                    />
                    <span>{doc}</span>
                  </li>
                ))}
              </ul>
            </div>
          );
        })}

        {/* ✅ Real <table> for fees — accessible to screen readers */}
        <div className="bg-slate-900 rounded-xl p-6 text-white">
          <h4 className="font-bold text-xl mb-6 flex items-center gap-3">
            <span
              className="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center"
              aria-hidden="true"
            >
              💰
            </span>
            {t("visa.fees_title")}
          </h4>

          <VisaFeesTable
            title={t("visa.label_business")}
            fees={businessFees}
            caption={t("visa.fees_caption_business")}
            headerDuration={t("visa.fees_header_duration")}
            headerFee={t("visa.fees_header_fee")}
          />

          <div className="border-t border-white/20 pt-4 mt-6">
            <p className="font-semibold text-amber-400 mb-2">
              {t("visa.label_other")}
            </p>
            <p className="text-2xl font-bold">{t("visa.price_other")}</p>
          </div>

          <p className="mt-6 text-slate-400 text-sm italic">
            {t("visa.fee_note")}
          </p>
        </div>
              <div className="flex flex-col items-center">
        <h3 className="text-xl font-bold text-slate-900 mb-2 text-center">
          {t("visa.form_notice")}
        </h3>
        <p className="text-slate-600 text-center mb-6">
          {t("visa.form_description")}
        </p>
        <DocumentDownloadCard
          href="/documents/Formulaire_de_demande_de_visa.pdf"
          imageSrc="/Image_Formulaire_de_demande_de_visa.jpg"
          imageAlt={t("visa.form_alt")}
          label={t("visa.download_button")}
          buttonColor="bg-blue-600 hover:bg-blue-700"
        />
      </div>
      </div>

      {/* Right Column — Download Form */}

    </div>
  );
}