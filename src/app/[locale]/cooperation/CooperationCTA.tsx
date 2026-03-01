import { useTranslations } from "next-intl";
import Link from "next/link"
export function CooperationCTA() {
  const t = useTranslations("Cooperation");

  return (
    <section
      aria-labelledby="cta-heading"
      className="py-20 bg-stone-900 text-white relative overflow-hidden"
    >
      {/* National colors bar */}
      <div
        className="absolute top-0 left-1/2 -translate-x-1/2 w-full max-w-7xl h-1 bg-gradient-to-r from-red-600 via-amber-500 to-green-600"
        aria-hidden="true"
      />

      <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
        <h2
          id="cta-heading"
          className="text-3xl md:text-4xl font-serif font-bold mb-6 text-amber-50"
        >
          {t("cta.title")}
        </h2>

        <p className="text-xl mb-10 text-stone-300 leading-relaxed">
          {t("cta.subtitle")}
        </p>

        {/* ✅ Links, not buttons — they navigate to pages */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link
            href="/contact"
            className="
              inline-flex items-center justify-center
              bg-amber-600 hover:bg-amber-700 text-white
              px-8 py-3.5 rounded-lg font-semibold
              transition-colors shadow-lg shadow-amber-900/20
              focus-visible:outline-none focus-visible:ring-2
              focus-visible:ring-amber-400 focus-visible:ring-offset-2
              focus-visible:ring-offset-stone-900
            "
          >
            {t("cta.btn_appointment")}
          </Link>

          <Link
            href="/documents/cooperation-guide.pdf"
            className="
              inline-flex items-center justify-center
              bg-transparent border-2 border-stone-600
              hover:border-white text-stone-300 hover:text-white
              px-8 py-3.5 rounded-lg font-semibold
              transition-all
              focus-visible:outline-none focus-visible:ring-2
              focus-visible:ring-white focus-visible:ring-offset-2
              focus-visible:ring-offset-stone-900
            "
          >
            {t("cta.btn_guide")}
          </Link>
        </div>
      </div>
    </section>
  );
}