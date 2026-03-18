
import Image from "next/image";
import { NewsletterForm } from "./NewsletterForm";
import { SocialIcon, ServiceIcon, GovernmentIcon } from "./Icons";

// Reusable styles as constants (better than @apply for tree-shaking)
const styles = {
  sectionTitle: "text-white font-bold text-lg mb-6 flex items-center gap-2",
  sectionAccent: "w-1.5 h-6 rounded-sm",
  bodyText: "text-gray-300 text-sm", // Changed from gray-400 for contrast
  mutedText: "text-gray-400 text-xs",
  contactLabel: "text-white text-sm font-medium",
} as const;

interface FooterContentProps {
  governmentLinks: Array<{
    name: string;
    link: string;
    iconType: "flag" | "landmark" | "globe" | "gavel" | "passport";
  }>;
  services: Array<{
    name: string;
    hours: string;
    iconType: "clock" | "passport" | "calendar";
  }>;
  socialMediaLinks: Array<{
    name: string;
    link: string;
    platform: "facebook" | "twitter" | "instagram" | "linkedin";
  }>;
  translations: Record<string, string>;
}

export function FooterContent({
  governmentLinks,
  services,
  socialMediaLinks,
  translations: t,
}: FooterContentProps) {
  return (
    <footer 
      className="bg-[#0f172a]  text-gray-300 font-sans relative"
      role="contentinfo"
      aria-label="Site footer"
    >
      {/* Top Border Accent - Burkina Faso Flag Colors */}
      <div 
        className="h-1 w-full bg-gradient-to-r from-burkina-red via-burkina-yellow to-burkina-green"
        aria-hidden="true"
      />

      {/* Emergency Banner */}
      <section 
        className="bg-footer-light border-b border-gray-800"
        role="alert"
        aria-live="polite"
        aria-label="Emergency contact information"
      >
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex flex-col sm:flex-row items-center justify-between text-center sm:text-left gap-4">
          <div className="flex items-center gap-3">
            {/* Removed animate-pulse to prevent CLS */}
            <div 
              className="bg-red-900/30 p-2 rounded-full border border-red-500/30 text-red-500"
              aria-hidden="true"
            >
              <svg 
                className="w-5 h-5" 
                fill="currentColor" 
                viewBox="0 0 20 20"
                aria-hidden="true"
              >
                <path 
                  fillRule="evenodd" 
                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" 
                  clipRule="evenodd" 
                />
              </svg>
            </div>
            <div>
              <h2 className="font-bold text-white uppercase tracking-wide text-sm">
                {t.emergencyTitle}
              </h2>
              <p className="text-xs text-gray-300">{t.emergencySubtitle}</p>
            </div>
          </div>
          <a
            href="tel:+919811144440"
            className="inline-flex items-center gap-2 bg-red-700 hover:bg-red-600 focus:ring-2 focus:ring-red-500 focus:ring-offset-2 focus:ring-offset-gray-900 text-white px-5 py-2.5 rounded text-sm font-bold transition-colors duration-200 shadow-md uppercase tracking-wider"
          >
            <svg 
              className="w-3 h-3" 
              fill="currentColor" 
              viewBox="0 0 20 20"
              aria-hidden="true"
            >
              <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
            </svg>
            <span>{t.callNow}</span>
          </a>
        </div>
      </section>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 lg:py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10 lg:gap-8">
          
          {/* Column 1: Embassy Identity */}
          <div className="space-y-6">
            <div className="flex items-start gap-4">
              <Image
                src="/Armoiries_du_Burkina_Faso.png"
                alt="" // Decorative - embassy name is in heading
                width={64}
                height={80}
                loading="lazy" // Changed from priority
                className="object-contain flex-shrink-0"
                sizes="64px"
              />
              <div>
                <h2 className="text-white font-serif text-lg font-bold leading-tight mb-1">
                  {t.embassyName}
                </h2>
                <span 
                  className="block w-12 h-0.5 bg-burkina-yellow mb-2"
                  aria-hidden="true"
                />
                <p className="text-gray-300 text-xs font-medium uppercase tracking-wide">
                  {t.location}
                </p>
              </div>
            </div>

            <p className={`${styles.bodyText} leading-relaxed border-l-2 border-gray-700 pl-4`}>
              {t.description}
            </p>

            {/* Social Media */}
            <nav aria-label="Social media links" className="pt-2">
              <h3 className="text-white text-sm font-bold mb-3 uppercase tracking-wider">
                {t.followUs}
              </h3>
              <ul className="flex gap-3" role="list">
                {socialMediaLinks.map((social, index) => (
                  <li key={index}>
                    <a
                      href={social.link}
                      className="w-9 h-9 rounded bg-gray-800 flex items-center justify-center text-gray-400 transition-all duration-200 hover:scale-105 hover:text-white focus:ring-2 focus:ring-burkina-yellow focus:ring-offset-2 focus:ring-offset-gray-900 social-link"
                      data-platform={social.platform}
                      aria-label={`${social.name} (opens in new tab)`}
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      <SocialIcon 
                        platform={social.platform} 
                        className="w-4 h-4" 
                        aria-hidden="true"
                      />
                    </a>
                  </li>
                ))}
              </ul>
            </nav>
          </div>

          {/* Column 2: Official Government Links */}
          <nav aria-label="Official government links">
            <h2 className={styles.sectionTitle}>
              <span 
                className={`${styles.sectionAccent} bg-burkina-red`}
                aria-hidden="true"
              />
              {t.officialLinks}
            </h2>

            
            {/* Hidden text for screen readers 
            <p id="external-link-hint" className="sr-only">
              {t.opensInNewTab}
            </p>
            */}
            
            <ul className="space-y-3" role="list">
              {governmentLinks.map((link, index) => (
                <li key={index}>
                  <a
                    href={link.link}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-describedby="external-link-hint"
                    className="group flex items-center gap-3 text-sm text-gray-300 hover:text-white focus:text-white focus:outline-none focus:ring-2 focus:ring-burkina-yellow focus:ring-offset-2 focus:ring-offset-gray-900 rounded transition-colors duration-200 py-1"
                  >
                    <span 
                      className="w-1.5 h-1.5 rounded-full bg-gray-600 group-hover:bg-burkina-yellow group-focus:bg-burkina-yellow transition-colors"
                      aria-hidden="true"
                    />
                    <span className="flex-1">{link.name}</span>
                    <svg 
                      className="w-2.5 h-2.5 opacity-0 group-hover:opacity-100 group-focus:opacity-100 transition-opacity"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                      aria-hidden="true"
                    >
                      <path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z" />
                      <path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z" />
                    </svg>
                  </a>
                </li>
              ))}
            </ul>
          </nav>

          {/* Column 3: Services & Hours */}
          <section aria-label="Service hours">
            <h2 className={styles.sectionTitle}>
              <span 
                className={`${styles.sectionAccent} bg-burkina-green`}
                aria-hidden="true"
              />
              {t.services}
            </h2>
            <ul className="space-y-4" role="list">
              {services.map((service, index) => (
                <li 
                  key={index} 
                  className="bg-gray-800/40 border border-gray-700/50 p-4 rounded hover:border-gray-600 focus-within:border-burkina-yellow transition-colors duration-200"
                >
                  <div className="flex items-center gap-3 mb-2">
                    <ServiceIcon 
                      type={service.iconType}
                      className="text-burkina-yellow w-4 h-4 flex-shrink-0"
                      aria-hidden="true"
                    />
                    <span className="text-gray-200 font-medium text-sm">
                      {service.name}
                    </span>
                  </div>
                  <p className={`${styles.mutedText} ml-7`}>
                    <time>{service.hours}</time>
                  </p>
                </li>
              ))}
            </ul>
          </section>

          {/* Column 4: Contact Information & Newsletter */}
          <section aria-label="Contact information">
            <h2 className={styles.sectionTitle}>
              <span 
                className={`${styles.sectionAccent} bg-burkina-yellow`}
                aria-hidden="true"
              />
              {t.contactUs}
            </h2>

            <address className="space-y-5 mb-8 not-italic">
              {/* Address */}
              <div className="flex gap-3 items-start">
                <svg 
                  className="w-4 h-4 text-gray-500 mt-1 flex-shrink-0"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  aria-hidden="true"
                >
                  <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
                </svg>
                <div>
                  <p className={styles.contactLabel}>{t.addressLine1}</p>
                  <p className={styles.mutedText}>{t.addressLine2}</p>
                </div>
              </div>

              {/* Phone */}
              <div className="flex gap-3 items-start">
                <svg 
                  className="w-4 h-4 text-gray-500 mt-1 flex-shrink-0"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  aria-hidden="true"
                >
                  <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
                </svg>
                <div>
                  <a 
                    href={`tel:${t.phoneStandard.replace(/\s/g, '')}`}
                    className={`${styles.contactLabel} hover:text-burkina-yellow focus:text-burkina-yellow transition-colors`}
                  >
                    {t.phoneStandard}
                  </a>
                  <p className={styles.mutedText}>{t.phoneLabelStandard}</p>
                </div>
              </div>

              {/* Email */}
              <div className="flex gap-3 items-start">
                <svg 
                  className="w-4 h-4 text-gray-500 mt-1 flex-shrink-0"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  aria-hidden="true"
                >
                  <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                  <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                </svg>
                <div>
                  <a 
                    href={`mailto:${t.emailAddress}`}
                    className={`${styles.contactLabel} hover:text-burkina-yellow focus:text-burkina-yellow transition-colors break-all`}
                  >
                    {t.emailAddress}
                  </a>
                  <p className={styles.mutedText}>{t.emailLabelMain}</p>
                </div>
              </div>
            </address>

            {/* Newsletter - Client Component Island */}
            <NewsletterForm title={t.newsletterTitle} />
          </section>
        </div>
      </div>

      {/* Bottom Bar */}
      <div className="border-t border-gray-800 bg-[#020617]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 flex flex-col md:flex-row justify-between items-center gap-4">
          <div className="text-center md:text-left">
            <p className="text-gray-400 text-xs">{t.copyright}</p>
            <p className="text-gray-500 text-xs mt-0.5">{t.diplomaticSince}</p>
          </div>

          <nav aria-label="Legal links">
            <ul className="flex flex-wrap justify-center gap-x-6 gap-y-2" role="list">
              {(['privacy', 'terms', 'cookies', 'accessibility', 'sitemap'] as const).map((item) => (
                <li key={item}>
                  <a 
                    href={`/${item}`}
                    className="text-gray-400 hover:text-burkina-yellow focus:text-burkina-yellow text-xs transition-colors focus:outline-none focus:ring-2 focus:ring-burkina-yellow focus:ring-offset-2 focus:ring-offset-gray-900 rounded"
                  >
                    {t[item]}
                  </a>
                </li>
              ))}
            </ul>
          </nav>
        </div>
      </div>
    </footer>
  );
}