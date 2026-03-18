import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "../globals.css";
import { NextIntlClientProvider } from 'next-intl';
import { getMessages } from 'next-intl/server';
import Header from './header';
import { PrimeReactProvider } from 'primereact/api';
import FooterComponents from "./components/footerComponents/index";
import { Breadcrumbs } from '@/components/Breadcrumbs';

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
  display: "swap",
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
  display: "swap",
});

export async function generateMetadata({ 
  params 
}: { 
  params: Promise<{ locale: string }> 
}): Promise<Metadata> {
  const { locale } = await params;
  const isFrench = locale === 'fr';
  
  return {
    title: {
      default: isFrench 
        ? 'Ambassade du Burkina Faso en Inde' 
        : 'Embassy of Burkina Faso in India',
      template: `%s | ${isFrench ? 'Ambassade du Burkina Faso' : 'Embassy of Burkina Faso'}`,
    },
    description: isFrench
      ? 'Site officiel - Représentation diplomatique du Burkina Faso en Inde'
      : 'Official website - Diplomatic representation of Burkina Faso in India',
    keywords: [
      'Embassy', 'Burkina Faso', 'India', 'Diplomacy', 
      'Consular Services', 'Visa', 'New Delhi', 'Ambassade'
    ],
    authors: [{ name: 'Embassy of Burkina Faso' }],
    creator: 'Embassy of Burkina Faso in India',
    publisher: 'Embassy of Burkina Faso',
    formatDetection: {
      email: false,
      address: false,
      telephone: false,
    },
    metadataBase: new URL('https://ambassadeburkinafasoindia.com'),
    alternates: {
      canonical: `/${locale}`,
      languages: {
        en: '/en',
        fr: '/fr',
      },
    },
    openGraph: {
      locale: locale === 'en' ? 'en_US' : 'fr_FR',
      type: 'website',
      siteName: isFrench 
        ? 'Ambassade du Burkina Faso en Inde' 
        : 'Embassy of Burkina Faso in India',
      url: `https://ambassadeburkinafasoindia.com/${locale}`,
    },
    twitter: {
      card: 'summary_large_image',
      title: isFrench 
        ? 'Ambassade du Burkina Faso en Inde' 
        : 'Embassy of Burkina Faso in India',
      description: isFrench
        ? 'Site officiel - Représentation diplomatique du Burkina Faso en Inde'
        : 'Official website - Diplomatic representation of Burkina Faso in India',
    },
    robots: {
      index: true,
      follow: true,
      googleBot: {
        index: true,
        follow: true,
        'max-video-preview': -1,
        'max-image-preview': 'large',
        'max-snippet': -1,
      },
    },
  };
}

export default async function LocaleLayout({
  children,
  params
}: {
  children: React.ReactNode;
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  const messages = await getMessages();

  return (
    <html lang={locale} className="scroll-smooth">
      <body className={`
        ${geistSans.variable} 
        ${geistMono.variable}
        min-h-screen 
        flex 
        flex-col 
        font-sans 
        antialiased
        bg-background
        text-foreground
      `}>
        {/* Skip to content link for accessibility */}
        <a
          href="#main-content"
          className="
            sr-only 
            focus:not-sr-only 
            focus:absolute 
            focus:top-4 
            focus:left-4 
            focus:z-[100] 
            focus:px-6 
            focus:py-3 
            focus:bg-white 
            focus:text-gray-900 
            focus:rounded-md 
            focus:shadow-xl
            focus:outline-none
            focus:ring-2
            focus:ring-red-600
            focus:ring-offset-2
            transition-all
            duration-200
            font-semibold
          "
        >
          Skip to main content
        </a>

        <PrimeReactProvider>
          <NextIntlClientProvider messages={messages}>
            <Header />
            
            {/* Breadcrumb Navigation - Hidden on homepage */}
            <div className="bg-gray-50 border-b border-gray-100 py-3">
              <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <Breadcrumbs />
              </div>
            </div>
            
            {/* Main content area */}
            <main id="main-content" className="flex-1">
              {children}
            </main>
            
            <FooterComponents />
          </NextIntlClientProvider>
        </PrimeReactProvider>
      </body>
    </html>
  );
}
