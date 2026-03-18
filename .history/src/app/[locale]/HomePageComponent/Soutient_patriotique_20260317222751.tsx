

import React from "react";
import Image from "next/image";
import { getTranslations } from "next-intl/server";

// ── Types ──────────────────────────────────────────────────
interface SupportDocument {
  href: string;
  titleKey: string;
  descKey: string;
  type: "pdf" | "external";
  filename?: string;
  fileSize?: string;
}

// ── Inline Icons (Server Component compatible) ─────────────
function DownloadIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      strokeWidth={1.5}
      viewBox="0 0 24 24"
      aria-hidden="true"
    >
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5M16.5 12L12 16.5m0 0L7.5 12m4.5 4.5V3"
      />
    </svg>
  );
}

function ExternalIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      strokeWidth={1.5}
      viewBox="0 0 24 24"
      aria-hidden="true"
    >
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M13.5 6H5.25A2.25 2.25 0 003 8.25v10.5A2.25 2.25 0 005.25 21h10.5A2.25 2.25 0 0018 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25"
      />
    </svg>
  );
}

function ShieldIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      strokeWidth={1.5}
      viewBox="0 0 24 24"
      aria-hidden="true"
    >
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z"
      />
    </svg>
  );
}

function FileIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      strokeWidth={1.5}
      viewBox="0 0 24 24"
      aria-hidden="true"
    >
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"
      />
    </svg>
  );
}

function GlobeIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      strokeWidth={1.5}
      viewBox="0 0 24 24"
      aria-hidden="true"
    >
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 017.843 4.582M12 3a8.997 8.997 0 00-7.843 4.582m15.686 0A11.953 11.953 0 0112 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0121 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0112 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 013 12c0-1.605.42-3.113 1.157-4.418"
      />
    </svg>
  );
}

// ── Main Component ─────────────────────────────────────────
async function PatrioticSupport() {
  const t = await getTranslations("Homepage.PatrioticSupport");

  const documents: SupportDocument[] = [
    {
      href: "/documents/RIB-EFFORT-GUERRE.pdf",
      titleKey: "docs.rib.title",
      descKey: "docs.rib.desc",
      type: "pdf",
      filename: "RIB-EFFORT-GUERRE.pdf",
      fileSize: "245 KB",
    },
    {
      href: "/documents/session-volontaire2.pdf",
      titleKey: "docs.voluntary.title",
      descKey: "docs.voluntary.desc",
      type: "pdf",
      filename: "session-volontaire2.pdf",
      fileSize: "180 KB",
    },
    {
      href: "https://www.mobilisation.gov.bf/",
      titleKey: "docs.portal.title",
      descKey: "docs.portal.desc",
      type: "external",
    },
  ];

  return (
    <section
      aria-labelledby="patriotic-heading"
      className="w-full max-w-7xl mx-auto px-2 sm:px-4 md:px-6 lg:px-8 py-6 sm:py-12 lg:py-20"
    >
      <div className="bg-white rounded-2xl shadow-lg border border-stone-200 overflow-hidden">
        {/* ── National Colors Bar ─────────────────────────── */}

        {/* ── Header ──────────────────────────────────────── */}
        <header className="px-2 sm:px-6 lg:px-12 pt-6 sm:pt-10 lg:pt-14 pb-6 sm:pb-8 text-center">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 bg-stone-900 text-amber-400 px-3 sm:px-4 py-2 rounded-full text-xs font-bold uppercase tracking-widest mb-4 sm:mb-6">
            <ShieldIcon className="w-4 h-4" />
            <span>{t("badge")}</span>
          </div>

          <h2
            id="patriotic-heading"
            className="text-2xl sm:text-3xl lg:text-5xl font-serif font-bold text-stone-900 leading-tight mb-2 sm:mb-4"
          >
            {t("title")}
          </h2>

          <p className="text-base sm:text-lg text-stone-600 max-w-2xl mx-auto leading-relaxed">
            {t("subtitle")}
          </p>
        </header>

        {/* ── Content Grid ────────────────────────────────── */}
        <div className="px-2 sm:px-6 lg:px-12 pb-6 sm:pb-10 lg:pb-14">
          <div className="flex flex-col lg:flex-row gap-6 sm:gap-10 lg:gap-14">
            {/* ── Image Column ───────────────────────────── */}
            <div className="w-full lg:w-5/12 flex flex-col items-center justify-center mb-8 lg:mb-0">
              <figure>
                <div className="relative rounded-xl overflow-hidden shadow-xl ring-1 ring-stone-200 w-60 h-40 sm:w-full sm:h-auto">
                  <Image
                    src="/soutient_patriotique.jpg"
                    alt={t("image_alt")}
                    width={600}
                    height={400}
                    className="w-full h-auto object-cover"
                    sizes="(max-width: 640px) 240px, (max-width: 768px) 100vw, (max-width: 1024px) 50vw, 40vw"
                    loading="lazy"
                    placeholder="blur"
                    blurDataURL="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAAIAAoDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAv/xAAhEAACAQMDBQAAAAAAAAAAAAABAgMABAUGIWGRkqGx0f/EABUBAQEAAAAAAAAAAAAAAAAAAAMF/8QAGhEAAgIDAAAAAAAAAAAAAAAAAAECEgMRkf/aAAwDAQACEQMRAD8AltJagyeH0AthI5xdrLcNM91BF5pX2HaUMk6obJekyqW4p/9k="
                  />

                  {/* Overlay caption bar */}
                  <div className="absolute bottom-0 inset-x-0 bg-gradient-to-t from-stone-900/80 to-transparent px-3 sm:px-5 pb-2 sm:pb-4 pt-6 sm:pt-10">
                    <p className="text-white/90 text-xs sm:text-sm font-medium">
                      {t("image_caption")}
                    </p>
                  </div>
                </div>
              </figure>

              {/* ── Callout Box (below image) ──────────── */}
              <div className="mt-4 sm:mt-6 bg-stone-900 rounded-xl p-4 sm:p-6 text-white">
                <div className="flex items-start gap-3 sm:gap-4">
                  <div className="w-8 h-8 sm:w-10 sm:h-10 rounded-full bg-amber-500/20 flex items-center justify-center flex-shrink-0 mt-0.5">
                    <ShieldIcon className="w-5 h-5 text-amber-400" />
                  </div>
                  <div>
                    <p className="font-serif font-bold text-base sm:text-lg text-amber-50 mb-1 sm:mb-2">
                      {t("callout.title")}
                    </p>
                    <p className="text-stone-300 text-xs sm:text-sm leading-relaxed">
                      {t("callout.text")}
                    </p>
                  </div>
                </div>
              </div>
            </div>

            {/* ── Documents Column ───────────────────────── */}
            <div className="w-full lg:w-7/12">
              <h3 className="text-xs sm:text-sm font-bold uppercase tracking-widest text-stone-400 mb-4 sm:mb-6">
                {t("docs_heading")}
              </h3>

              <div className="space-y-3 sm:space-y-4">
                {documents.map((doc, index) => {
                  const isPDF = doc.type === "pdf";
                  const isExternal = doc.type === "external";

                  return (
                    <a
                      key={index}
                      href={doc.href}
                      {...(isExternal && {
                        target: "_blank",
                        rel: "noopener noreferrer",
                      })}
                      {...(isPDF && { download: doc.filename })}
                      aria-label={
                        isPDF
                          ? `${t(doc.titleKey)} — ${t("aria.download_pdf")} (${doc.fileSize})`
                          : `${t(doc.titleKey)} — ${t("aria.opens_new_tab")}`
                      }
                      className="
                        group block rounded-xl
                        focus-visible:outline-none
                        focus-visible:ring-2 focus-visible:ring-stone-900
                        focus-visible:ring-offset-2
                      "
                    >
                      <div
                        className="
                          relative flex items-center gap-3 sm:gap-5 p-3 sm:p-5 sm:p-6
                          bg-stone-50 rounded-xl border border-stone-200
                          hover:bg-white hover:shadow-md hover:border-stone-300
                          transition-all duration-300
                          overflow-hidden
                        "
                      >


                        {/* Icon */}
                        <div
                          className={`
                            w-10 h-10 sm:w-14 sm:h-14 rounded-xl
                            flex items-center justify-center flex-shrink-0
                            transition-all duration-300
                            ${
                              index === 0
                                ? "bg-red-50 group-hover:bg-red-100"
                                : index === 1
                                  ? "bg-green-50 group-hover:bg-green-100"
                                  : "bg-amber-50 group-hover:bg-amber-100"
                            }
                          `}
                          aria-hidden="true"
                        >
                          {isPDF ? (
                            <FileIcon
                              className={`
                                w-5 h-5 sm:w-6 sm:h-6 transition-colors duration-300
                                ${
                                  index === 0
                                    ? "text-red-600"
                                    : "text-green-600"
                                }
                              `}
                            />
                          ) : (
                            <GlobeIcon className="w-5 h-5 sm:w-6 sm:h-6 text-amber-600 transition-colors duration-300" />
                          )}
                        </div>

                        {/* Text */}
                        <div className="flex-1 min-w-0">
                          <p
                            className={`
                              font-bold text-sm sm:text-base md:text-lg text-stone-900
                              transition-colors duration-300 leading-snug mb-0.5 sm:mb-1
                              ${
                                index === 0
                                  ? "group-hover:text-red-800"
                                  : index === 1
                                    ? "group-hover:text-green-800"
                                    : "group-hover:text-amber-800"
                              }
                            `}
                          >
                            {t(doc.titleKey)}
                          </p>
                          <p className="text-xs sm:text-sm text-stone-500 leading-relaxed">
                            {t(doc.descKey)}
                          </p>
                          {/* Meta */}
                          <div className="flex items-center gap-1 sm:gap-2 mt-1 sm:mt-2">
                            {isPDF && (
                              <>
                                <span className="inline-flex items-center gap-1 text-xs font-bold uppercase tracking-wider text-stone-400 bg-stone-100 px-2 py-0.5 rounded">
                                  PDF
                                </span>
                                {doc.fileSize && (
                                  <span className="text-xs text-stone-400">
                                    {doc.fileSize}
                                  </span>
                                )}
                              </>
                            )}
                            {isExternal && (
                              <span className="inline-flex items-center gap-1 text-xs font-bold uppercase tracking-wider text-amber-600 bg-amber-50 px-2 py-0.5 rounded">
                                {t("meta.external")}
                              </span>
                            )}
                          </div>
                        </div>

                        {/* Action Icon */}
                        <div
                          className="
                            w-8 h-8 sm:w-10 sm:h-10 rounded-full
                            bg-stone-100 group-hover:bg-stone-200
                            flex items-center justify-center flex-shrink-0
                            transition-all duration-300
                            group-hover:translate-x-0.5
                          "
                          aria-hidden="true"
                        >
                          {isPDF ? (
                            <DownloadIcon className="w-4 h-4 sm:w-5 sm:h-5 text-stone-500 group-hover:text-stone-700 transition-colors" />
                          ) : (
                            <ExternalIcon className="w-4 h-4 sm:w-5 sm:h-5 text-stone-500 group-hover:text-stone-700 transition-colors" />
                          )}
                        </div>
                      </div>
                    </a>
                  );
                })}
              </div>

              {/* ── Help Text ──────────────────────────────── */}
              <p className="text-xs sm:text-sm text-stone-500 mt-4 sm:mt-6 flex items-start gap-2 sm:gap-2.5 leading-relaxed">
                <svg
                  className="w-4 h-4 flex-shrink-0 mt-0.5 text-stone-400"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  aria-hidden="true"
                >
                  <path
                    fillRule="evenodd"
                    d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                    clipRule="evenodd"
                  />
                </svg>
                <span>{t("help_text")}</span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default PatrioticSupport;