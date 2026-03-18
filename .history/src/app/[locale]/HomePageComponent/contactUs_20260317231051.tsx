import { getTranslations } from "next-intl/server";
import { ContactForm } from "./ContactForm";

// ── Centralized Contact Data ────────────────────────────
const EMBASSY = {
  address: "F-2/4, Vasant Vihar, New Delhi - 110057, India",
  phone: "+91-11-26140641",
  phoneAlt: "+91-11-26140642",
  fax: "+91-11-26140630",
  email: "ambassadeburkinafasoindia@gmail.com",
  hours: { weekdays: "09:00 – 17:00", weekend: "Closed" },
  mapUrl:
    "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3184.7761604602197!2d77.15817457508905!3d28.564767975701855!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390d1d577a03c69b%3A0xa0b574164f76fdc6!2sEmbassy%20of%20Burkina%20Faso%20in%20Delhi!5e1!3m2!1sen!2sbf!4v1770747912469!5m2!1sen!2sbf",
} as const;

// ── Icons (Server Component compatible) ─────────────────
function PhoneIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
    </svg>
  );
}

function EmailIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
      <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
    </svg>
  );
}

function LocationIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
    </svg>
  );
}

function ClockIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clipRule="evenodd" />
    </svg>
  );
}

function AlertIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" stroke="currentColor" strokeWidth={1.5} viewBox="0 0 24 24" aria-hidden="true">
      <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
    </svg>
  );
}



function MailIcon({ className }: { className?: string }) {
  return (
    <svg className={className} fill="none" stroke="currentColor" strokeWidth={1.5} viewBox="0 0 24 24" aria-hidden="true">
      <path strokeLinecap="round" strokeLinejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
    </svg>
  );
}

// ── Main Page Component ─────────────────────────────────
export default async function ContactPage() {
  const t = await getTranslations("Homepage.ContactSection");

  // Contact info card data
  const contactCards = [
    {
      icon: <PhoneIcon className="w-5 h-5" />,
      title: t("info.phone.title"),
      content: (
        <div className="space-y-0.5">
          <a href={`tel:${EMBASSY.phone}`} className="block hover:text-stone-900 transition-colors focus-visible:outline-none focus-visible:underline">
            {EMBASSY.phone}
          </a>
          <a href={`tel:${EMBASSY.phoneAlt}`} className="block hover:text-stone-900 transition-colors focus-visible:outline-none focus-visible:underline">
            {EMBASSY.phoneAlt}
          </a>
        </div>
      ),
      accent: "bg-stone-900",
    },
    {
      icon: <EmailIcon className="w-5 h-5" />,
      title: t("info.email.title"),
      content: (
        <a href={`mailto:${EMBASSY.email}`} className="hover:text-stone-900 transition-colors break-all focus-visible:outline-none focus-visible:underline">
          {EMBASSY.email}
        </a>
      ),
      accent: "bg-stone-900",
    },
    {
      icon: <LocationIcon className="w-5 h-5" />,
      title: t("info.address.title"),
      content: <address className="not-italic">{EMBASSY.address}</address>,
      accent: "bg-stone-900",
    },
    {
      icon: <ClockIcon className="w-5 h-5" />,
      title: t("info.hours.title"),
      content: (
        <div className="space-y-0.5">
          <p>
            <span className="font-medium text-stone-700">{t("info.hours.weekdays")}:</span>{" "}
            {EMBASSY.hours.weekdays}
          </p>
          <p>
            <span className="font-medium text-stone-700">{t("info.hours.weekend")}:</span>{" "}
            {EMBASSY.hours.weekend}
          </p>
        </div>
      ),
      accent: "bg-amber-600",
    },
  ];

  return (
    <main className="min-h-screen bg-stone-50">
      <section className="relative bg-stone-900 text-white overflow-hidden w-full">
        {/* National colors bar */}


        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 lg:py-20 text-center">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 bg-white/10 backdrop-blur-sm text-amber-400 px-4 py-2 rounded-full text-xs font-bold uppercase tracking-widest mb-6">
            <MailIcon className="w-4 h-4" />
            <span>{t("badge")}</span>
          </div>

          <h1
            id="contact-heading"
            className="text-4xl sm:text-5xl lg:text-6xl font-serif font-bold text-amber-50 mb-4 tracking-tight"
          >
            {t("title")}
          </h1>

          <p className="text-lg text-stone-300 max-w-2xl mx-auto leading-relaxed">
            {t("subtitle")}
          </p>
        </div>

        {/* Decorative */}
        <div className="absolute -bottom-24 -right-24 w-96 h-96 bg-amber-500/5 rounded-full blur-3xl" aria-hidden="true" />
      </section>

      {/* ════════════════════════════════════════════════════
          CONTACT INFO CARDS (overlapping hero)
         ════════════════════════════════════════════════════ */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8 relative z-10">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {contactCards.map((card, i) => (
            <div
              key={i}
              className="flex flex-col items-center p-6 rounded-xl bg-white shadow-sm border border-stone-100 hover:shadow-md hover:border-stone-200 transition-all duration-300 text-center"
            >
              <div
                className={`w-12 h-12 rounded-xl ${card.accent} text-white flex items-center justify-center mb-4`}
                aria-hidden="true"
              >
                {card.icon}
              </div>
              <h2 className="font-serif font-bold text-stone-900 mb-1">{card.title}</h2>
              <div className="text-stone-600 text-sm">{card.content}</div>
            </div>
          ))}
        </div>
      </div>

      {/* ════════════════════════════════════════════════════
          FORM + MAP + NOTICES
         ════════════════════════════════════════════════════ */}
      <section
        aria-labelledby="form-heading"
        className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 lg:py-20"
      >
        <div className="flex flex-col lg:flex-row gap-12 lg:gap-16">
          {/* ── Left: Form ─────────────────────────────── */}
          <div className="w-full lg:w-7/12">
            <div className="bg-white rounded-2xl shadow-sm border border-stone-200 p-8 lg:p-10">
              {/* Header */}
              <div className="mb-8">
                <h2
                  id="form-heading"
                  className="text-2xl lg:text-3xl font-serif font-bold text-stone-900 mb-2"
                >
                  {t("form.heading")}
                </h2>
                <p className="text-stone-500 text-sm leading-relaxed">
                  {t("form.description")}
                </p>
              </div>

              {/* Client-side form */}
              <ContactForm />
            </div>
          </div>

          {/* ── Right: Map + Notices ────────────────────── */}
          <div className="w-full lg:w-5/12 space-y-6">
            {/* Map */}
            <div className="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden">
              <div className="aspect-[4/3] relative">
                <iframe
                  title={t("map.title")}
                  aria-label={t("map.aria_label")}
                  src={EMBASSY.mapUrl}
                  className="absolute inset-0 w-full h-full"
                  style={{ border: 0 }}
                  allowFullScreen
                  loading="lazy"
                  referrerPolicy="no-referrer-when-downgrade"
                />
              </div>
              <div className="px-6 py-4 border-t border-stone-100">
                <p className="text-sm text-stone-600 font-medium">
                  {EMBASSY.address}
                </p>
              </div>
            </div>



            {/* Emergency */}
            <div className="bg-red-50 rounded-2xl border border-red-200 p-6">
              <div className="flex items-start gap-4">
                <div className="w-10 h-10 bg-red-600 rounded-xl flex items-center justify-center flex-shrink-0">
                  <AlertIcon className="w-5 h-5 text-white" />
                </div>
                <div>
                  <h3 className="font-bold text-red-900 mb-1">
                    {t("emergency.title")}
                  </h3>
                  <p className="text-sm text-red-800 leading-relaxed">
                    {t("emergency.text")}
                  </p>
                  <a
                    href={`tel:${EMBASSY.phone}`}
                    className="inline-flex items-center gap-1.5 mt-3 text-sm font-bold text-red-700 hover:text-red-900 transition-colors focus-visible:outline-none focus-visible:underline"
                  >
                    <PhoneIcon className="w-4 h-4" />
                    {EMBASSY.phone}
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}