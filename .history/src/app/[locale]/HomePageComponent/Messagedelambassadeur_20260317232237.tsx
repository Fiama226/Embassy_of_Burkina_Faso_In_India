import React from "react";
import Image from "next/image";
import { getTranslations } from "next-intl/server";

async function Messagedelambassadeur() {
  const t = await getTranslations("Homepage");
  const msg = (key) => t(`Messagedelambassadeur.${key}`);

  return (
    <section className="generalsection w-[90vw] self-center mx-auto px-2 sm:px-4 md:px-6 lg:px-8 py-6 sm:py-8 lg:py-10">
      {/* Section Header */}
      <div className="text-center mb-8 sm:mb-12">
        <div className="inline-block">
          <h2 className="text-2xl sm:text-4xl lg:text-5xl xl:text-6xl font-bold font-serif text-stone-900 mb-3 sm:mb-4 leading-[1.15]">
            {msg("title")}
          </h2>
        </div>
      </div>

      {/* Main Content Card */}
      <div className="shadow-lg border border-gray-200 overflow-hidden">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 sm:gap-8 p-4 sm:p-8 lg:p-12">

          {/* Left Column - Ambassador Photo */}
          <div className="lg:col-span-1 mb-8 lg:mb-0">
            <div className="sticky top-24">
              <div className="relative w-full aspect-square rounded-lg overflow-hidden shadow-xl border-4 border-gray-100 max-w-xs mx-auto">
                <Image
                  alt={msg("alt")}
                  src="/burkina_ambassador.jpeg"
                  fill
                  priority
                  className="object-cover"
                  sizes="(max-width: 1024px) 100vw, 33vw"
                />
              </div>

              {/* Ambassador Info */}
              <div className="mt-4 sm:mt-6 text-center p-3 sm:p-4 bg-gray-50 rounded-lg border border-gray-200">
                <p className="text-base sm:text-lg font-bold text-gray-900 font-serif">
                  {msg("signature.name")}
                </p>
                <p className="text-xs sm:text-sm text-gray-600 mt-1">
                  {msg("signature.title")}
                </p>
              </div>
            </div>
          </div>

          {/* Right Column - Message */}
          <div className="lg:col-span-2">
            <div className="prose prose-base sm:prose-lg max-w-none">

              {/* Opening Quote */}
              <div className="relative mb-6 sm:mb-8">
                <div className="absolute -left-4 -top-2 text-4xl sm:text-6xl text-[#EF2D2D] opacity-20 font-serif">"</div>
                <p className="text-lg sm:text-xl lg:text-2xl leading-relaxed text-gray-800 font-serif italic pl-6 sm:pl-8">
                  {msg("text1")}
                </p>
              </div>

              {/* Message Body */}
              <div className="space-y-6 text-gray-700 leading-relaxed">
                <p className="text-base lg:text-lg">
                  {msg("text2")}
                </p>

                <p className="text-base lg:text-lg">
                  {msg("text3")}
                </p>

                <p className="text-base lg:text-lg font-semibold text-gray-900 border-l-4 border-[#FCD116] pl-4 py-2 bg-gray-50">
                  {msg("text4")}
                </p>
              </div>

              {/* Decorative Element */}
              <div className="mt-8 pt-6 border-t border-gray-200">
                <div className="flex items-center gap-2 text-sm text-gray-500">
                  <div className="h-px flex-1 bg-gradient-to-r from-[#EF2D2D] via-[#FCD116] to-[#009E49]"></div>
                  <span className="px-3">Embassy of Burkina Faso</span>
                  <div className="h-px flex-1 bg-gradient-to-r from-[#009E49] via-[#FCD116] to-[#EF2D2D]"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Messagedelambassadeur;