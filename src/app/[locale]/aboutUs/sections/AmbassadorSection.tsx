import Image from "next/image";
import { useTranslations } from "next-intl";

export function AmbassadorSection() {
  const t = useTranslations("AboutPage.ambassador");

  // ✅ Split bio into paragraphs from translation
  const bioParagraphs = t.raw("bio") as string[];

  return (
    <div className="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden">

      <div className="p-8 lg:p-12">
        {/* Title */}
        <h2 className="text-3xl lg:text-4xl font-serif font-bold text-center text-stone-900 ">
          {t("title")}
        </h2>
                <div
          className="h-1 w-24 bg-red-600 mx-auto rounded-full mb-10"
          aria-hidden="true"
        />

          {/* Photo */}
          <div className="">
            <figure className="relative rounded-2xl overflow-hidden shadow-xl border-4 border-white ring-1 ring-stone-200 w-6/12  float-left m-5">
              <Image
                src="/burkina_ambassador.jpeg"
                alt={t("photo_alt")}
                width={500}
                height={300}
                className="w-full h-[250px] object-cover "
                priority
                sizes="(max-width: 500px) 100vw, 40vw"
              />
              <figcaption className="bg-stone-900 text-white px-6 py-4">
                <p className="font-serif font-bold text-lg">
                  {t("ambassador_name")}
                </p>
                <p className="text-amber-400 text-sm font-medium mt-1">
                  {t("ambassador_title")}
                </p>
              </figcaption>
            </figure>

          {/* Bio */}
            <div className="space-y-5">
              {bioParagraphs.map((paragraph, i) => (
                <p
                  key={i}
                  className="text-stone-700 leading-relaxed text-base lg:text-lg"
                >
                  {paragraph}
                </p>
              ))}

            {/* Mission Pillars */}
            <div className="mt-10 grid sm:grid-cols-3 gap-4">
              {(["economic", "technology", "education"] as const).map(
                (pillar) => (
                  <div
                    key={pillar}
                    className="bg-stone-50 rounded-xl p-5 border border-stone-100 text-center"
                  >
                    <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mb-2">
                      {t(`pillars.${pillar}.label`)}
                    </p>
                    <p className="text-sm text-stone-700 font-medium leading-relaxed">
                      {t(`pillars.${pillar}.desc`)}
                    </p>
                  </div>
                )
              )}
            </div>

            {/* Divider */}
            <div
              className="mt-10 flex items-center gap-4"
              aria-hidden="true"
            >
              <span className="h-px bg-stone-200 flex-1" />
              <span className="text-stone-400 text-xs uppercase tracking-widest font-bold">
                {t("divider_text")}
              </span>
              <span className="h-px bg-stone-200 flex-1" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}