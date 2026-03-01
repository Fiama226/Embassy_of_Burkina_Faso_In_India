"use client";

import { useTranslations } from "next-intl";
import { RequirementList } from "../ui/RequirementList";
import { DocumentDownloadCard } from "../ui/DocumentDownloadCard";
import { WarningBox } from "../ui/WarningBox";

export function PassportSection() {
  const t = useTranslations("Consular");

  // ✅ All text fetched via translation — supports i18n + RTL
  const passportSections = [
    {
      title: t("passport.general.title"),
      docs: t.raw("passport.general.docs") as string[],
    },
    {
      title: t("passport.marriage.title"),
      docs: t.raw("passport.marriage.docs") as string[],
    },
    {
      title: t("passport.minor.title"),
      docs: t.raw("passport.minor.docs") as string[],
    },
    {
      title: t("passport.renewal.title"),
      docs: t.raw("passport.renewal.docs") as string[],
    },
  ];

  return (
    <div className="flex flex-col gap-10">
      {/* Requirements Column */}
      <div className="space-y-8 grid lg:grid-cols-2 gap-10 justify-center">
        {passportSections.map((section, idx) => (
          <div
            key={idx}
            className="bg-slate-50 rounded-xl p-6 border border-slate-100"
          >
            <h3 className="font-bold text-lg text-slate-900 mb-4 flex items-center gap-3">
              <span
                className="w-8 h-8 bg-rose-600 text-white rounded-lg
                  flex items-center justify-center text-sm font-bold"
                aria-hidden="true"
              >
                {idx + 1}
              </span>
              {section.title}
            </h3>
            <RequirementList items={section.docs} />
          </div>
        ))}



      </div>
                    <div className="flex flex-col items-center">
        <h3 className="text-xl font-bold text-slate-900 mb-6 text-center">
          {t("passport.download_title")}
        </h3>
        <DocumentDownloadCard
          href="/documents/Formulaire_de_demande_de_passeport.pdf"
          imageSrc="/Image_Formulaire_de_demande_de_passeport.jpg"
          imageAlt={t("passport.form_alt")}
          label={t("passport.download_button")}
        />
      </div>

      {/* Download Column */}
              <WarningBox
          title={t("passport.loss_title")}
          message={t("passport.loss_text")}
        />

    </div>
  );
}