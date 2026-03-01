"use client";

import { useTranslations } from "next-intl";
import { FaFileAlt, FaCheckCircle } from "react-icons/fa";
import { DocumentDownloadCard } from "../ui/DocumentDownloadCard";

export function ConsularCardSection() {
  const t = useTranslations("Consular");
  const docs = t.raw("consular_card.docs") as string[];

  return (
    <div className="space-y-8">
      {/* Description */}
      <div className="bg-slate-50 rounded-xl p-6 lg:p-8">
        <p className="text-slate-700 leading-relaxed mb-4">
          {t("consular_card.desc1")}
        </p>
        <p className="text-slate-700 leading-relaxed">
          {t("consular_card.desc2")}
        </p>
      </div>

      {/* Required Documents */}
      <div className="bg-emerald-50 rounded-xl p-6 lg:p-8 border border-emerald-200">
        <h3 className="font-bold text-xl text-emerald-900 mb-6 flex items-center gap-3">
          <span className="w-10 h-10 bg-emerald-600 rounded-lg flex items-center justify-center">
            <FaFileAlt className="text-white" aria-hidden="true" />
          </span>
          {t("consular_card.docs_title")}
        </h3>

        <ul className="grid sm:grid-cols-2 gap-4" role="list">
          {docs.map((doc, i) => (
            <li
              key={i}
              className="flex items-start gap-3 bg-white rounded-lg p-4 shadow-sm"
            >
              <FaCheckCircle
                className="text-emerald-500 mt-0.5 flex-shrink-0 w-4 h-4"
                aria-hidden="true"
              />
              <span className="text-slate-700 text-sm">{doc}</span>
            </li>
          ))}
        </ul>
      </div>

      {/* Download Forms */}
      <div className="grid md:grid-cols-2 gap-6">
        <DocumentDownloadCard
          href="/documents/Formulaire_de_demande_de_carte_consulaire.pdf"
          imageSrc="/Image_Formulaire_de_demande_de_carte_consulaire.jpg"
          imageAlt={t("consular_card.form_alt")}
          label={t("consular_card.download_card_form")}
          buttonColor="bg-emerald-600 hover:bg-emerald-700"
          compact
        />
        <DocumentDownloadCard
          href="/documents/Fiche_d_immatriculation.pdf"
          imageSrc="/Image_Fiche_d_immatriculation_page.jpg"
          imageAlt={t("consular_card.registration_form_alt")}
          label={t("consular_card.download_registration_form")}
          buttonColor="bg-emerald-600 hover:bg-emerald-700"
          compact
        />
      </div>
    </div>
  );
}