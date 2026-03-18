import { useTranslations } from "next-intl";
import Image from "next/image";

export function CooperationIntro() {
  const t = useTranslations("Cooperation");

  return (
    <section aria-labelledby="intro-heading" className="py-20 bg-stone-50">
      <div className="max-w-7xl mx-auto px-4">
        <div className="grid md:grid-cols-2 gap-12 lg:gap-16 items-center">
          {/* Text */}
          <div>
            <h2
              id="intro-heading"
              className="text-3xl md:text-4xl font-serif font-bold text-stone-900 mb-8 border-l-4 border-red-700 pl-6"
            >
              {t("intro.title")}
            </h2>
            <div className="space-y-6">
              <p className="text-stone-600 leading-relaxed text-lg">
                {t("intro.p1")}
              </p>
              <p className="text-stone-600 leading-relaxed text-lg">
                {t("intro.p2")}
              </p>
            </div>
          </div>

          {/* Image — replaces the meaningless icon box */}
          <div className="relative aspect-[4/3] rounded-xl overflow-hidden shadow-xl">
            <Image
              src="/images/cooperation-handshake.jpg"
              alt={t("intro.image_alt")}
              fill
              className="object-cover"
              sizes="(max-width: 768px) 100vw, 50vw"
              priority
            />
            {/* Fallback if no image: subtle gradient + icon */}
            {/* Remove this div once you have a real image */}
            <div className="absolute inset-0 bg-gradient-to-br from-stone-800 to-stone-900 flex items-center justify-center">
              <div className="text-center">
                <div className="flex items-center justify-center gap-6 mb-4">
                  <Image
                    src="/handshakeBFIn.png"
                    alt="hanshake icon"
                    width={64}
                    height={64}
                    className="rounded-full border-2 border-white/20 w-full h-full object-cover"
                  />
                </div>
                <p className="text-white/60 text-sm font-medium tracking-wide uppercase">
                  {t("intro.partnership_label")}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}