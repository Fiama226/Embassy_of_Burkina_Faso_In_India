"use client";

import { useTranslations } from "next-intl";
import { FaFileAlt } from "react-icons/fa";

export function MiscSection() {
  const t = useTranslations("Consular");
  const documents = t.raw("miscellaneous.documents") as string[];

  return (
    <div className="bg-slate-50 rounded-xl p-8 space-y-6">
      <div className="flex items-start gap-4">
        <div
          className="w-12 h-12 bg-slate-700 rounded-xl flex items-center justify-center flex-shrink-0"
          aria-hidden="true"
        >
          <FaFileAlt className="text-white text-xl" />
        </div>
        <div>
          <p className="text-slate-700 leading-relaxed mb-4">
            {t("miscellaneous.desc1")}
          </p>
          <p className="text-slate-700 leading-relaxed">
            {t("miscellaneous.desc2")}
          </p>
        </div>
      </div>

      <ul
        className="grid sm:grid-cols-3 gap-4 pt-6 list-none"
        role="list"
      >
        {documents.map((doc, i) => (
          <li
            key={i}
            className="bg-white rounded-xl p-5 text-center shadow-sm border border-slate-100"
          >
            <div
              className="w-12 h-12 bg-slate-100 rounded-xl flex items-center justify-center mx-auto mb-3"
              aria-hidden="true"
            >
              <FaFileAlt className="text-slate-600" />
            </div>
            <p className="font-medium text-slate-900 text-sm">{doc}</p>
          </li>
        ))}
      </ul>
    </div>
  );
}