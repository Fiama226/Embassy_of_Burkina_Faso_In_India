'use client';

import { usePathname } from 'next/navigation';
import { Link } from '@/i18n/routing';
import { useTranslations } from 'next-intl';
import { FaChevronRight, FaHome } from 'react-icons/fa';

/**
 * Breadcrumbs Component
 * 
 * Displays navigation breadcrumbs based on current URL path.
 * Automatically hides on homepage (/).
 * 
 * @example
 * // URL: /en/servicesConsulaires/passport
 * // Output: Home / Services Consulaires / Passport
 */
export function Breadcrumbs() {
  const pathname = usePathname();
  const t = useTranslations('layout');
  
  // Don't render on homepage
  if (pathname === '/' || pathname === '/en' || pathname === '/fr') {
    return null;
  }

  // Filter out locale segment and empty strings
  const segments = pathname.split('/').filter(Boolean);
  
  // Remove locale from segments for display
  const locale = segments[0];
  const isLocale = locale === 'en' || locale === 'fr';
  const pathSegments = isLocale ? segments.slice(1) : segments;

  // Don't render if no segments after locale
  if (pathSegments.length === 0) {
    return null;
  }

  // Translation mapping for common paths
  const getTranslatedName = (segment: string): string => {
    const translations: Record<string, string> = {
      // Navigation items
      servicesConsulaires: t('header.consularServices'),
      bilateralCooperation: t('header.bilateralCooperation'),
      news: t('header.news'),
      aboutUs: t('header.aboutUs'),
      burkinaFaso: t('header.burkinaFaso'),
      cooperation: t('header.indiaBurkinaCooperation'),
      HomePageComponent: t('header.home'),
      
      // Consular services sub-pages
      passport: 'Passport',
      visa: 'Visa',
      'consular-card': 'Consular Card',
      
      // About us sub-pages
      ambassador: t('header.theAmbassador'),
      'reseau-consulaire': t('header.theConsularNetwork'),
    };

    return translations[segment] || 
      segment
        .split('-')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ');
  };

  return (
    <nav 
      aria-label="Breadcrumb" 
      className="text-sm"
    >
      <ol className="flex items-center flex-wrap gap-1 sm:gap-2">
        {/* Home link */}
        <li>
          <Link 
            href="/" 
            className="flex items-center gap-1.5 text-gray-500 hover:text-red-600 transition-colors duration-200"
            aria-label={t('header.home')}
          >
            <FaHome className="w-3.5 h-3.5" />
            <span className="hidden sm:inline">{t('header.home')}</span>
          </Link>
        </li>

        {/* Path segments */}
        {pathSegments.map((segment, index) => {
          const isLast = index === pathSegments.length - 1;
          const href = `/${[locale, ...pathSegments.slice(0, index + 1)].filter(Boolean).join('/')}`;
          const label = getTranslatedName(segment);

          return (
            <li 
              key={segment} 
              className="flex items-center gap-1 sm:gap-2"
              aria-current={isLast ? 'page' : undefined}
            >
              <FaChevronRight className="w-3 h-3 text-gray-400 flex-shrink-0" />
              
              {isLast ? (
                <span className="text-gray-900 font-semibold truncate max-w-[200px] sm:max-w-none">
                  {label}
                </span>
              ) : (
                <Link 
                  href={href}
                  className="text-gray-500 hover:text-red-600 transition-colors duration-200 truncate max-w-[150px] sm:max-w-none"
                >
                  {label}
                </Link>
              )}
            </li>
          );
        })}
      </ol>
    </nav>
  );
}
