
"use client";

import React, { useState, useEffect, useRef } from "react";
import { Link } from "@/i18n/routing";
import { useRouter, usePathname } from "next/navigation";
import { useLocale } from "next-intl";
import {
  FaFacebookF,
  FaInstagram,
  FaLinkedinIn,
  FaTwitter,
  FaBars,
  FaTimes,
  FaExternalLinkAlt,
  FaPhone,
  FaEnvelope,
  FaMapMarkerAlt,
  FaChevronDown,
  FaGlobe,
  FaClock,
} from "react-icons/fa";
import { useTranslations } from "next-intl";
import Image from "next/image";

const Header = () => {
  const router = useRouter();
  const pathname = usePathname();
  const locale = useLocale();

  function changeLocale(newLocale: string) {
    const segments = pathname.split("/");
    segments[1] = newLocale; // replace locale in URL
    router.push(segments.join("/"));
  }
  const t = useTranslations("layout");
  const h = (key) => t(`header.${key}`);
  const s = (key) => t(`social.${key}`);

  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState<number | null>(null);
  const [scrollProgress, setScrollProgress] = useState(0);
  const [currentTime, setCurrentTime] = useState("");
  const mobileMenuRef = useRef<HTMLDivElement>(null);

  // Helper to check if link is active
  const isActive = (href: string) => {
    if (href === "/") {
      return pathname === "/" || pathname === `/${locale}`;
    }
    return pathname === href || pathname?.startsWith(`${href}/`);
  };


  /* ---------- Government Links ---------- */
  const governmentLinks = [
    { key: "governmentOfBurkinaFaso", link: "https://www.presidencedufaso.bf/gouvernement/" },
    { key: "investments", link: "https://www.investburkina.com/" },
    { key: "tourism", link: "https://www.ontb.bf/" },
    { key: "eVisa", link: "https://applicant.visaburkina.bf/" },
  ];

  /* ---------- Social Media Links ---------- */
  const socialMediaLinks = [
    { key: "Facebook", link: "", icon: FaFacebookF, id: 1 },
    { key: "Instagram", link: "", icon: FaInstagram, id: 2 },
    { key: "Twitter", link: "", icon: FaTwitter, id: 3 },
    { key: "LinkedIn", link: "", icon: FaLinkedinIn, id: 4 },
  ];

  /* ---------- Navigation Items ---------- */
  const navigationItems = [
    { key: "home", href: "/", type: "link" },
    { key: "consularServices", href: "/servicesConsulaires", type: "link" },
    {
      key: "bilateralCooperation",
      type: "dropdown",
      items: [
        { key: "burkinaFaso", href: "/burkinaFaso" },
        { key: "indiaBurkinaCooperation", href: "/cooperation" },
      ],
    },
    { key: "news", href: "/News", type: "link" },
    {
      key: "aboutUs",
      type: "link",
      href: "/aboutUs",
    },
  ];

  /* ---------- Scroll / Click Outside Effects ---------- */
  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 50);
      
      // Calculate scroll progress
      const totalHeight = document.documentElement.scrollHeight - window.innerHeight;
      const progress = (window.scrollY / totalHeight) * 100;
      setScrollProgress(progress);
    };
    
    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  // Update local time for New Delhi
  useEffect(() => {
    const updateTime = () => {
      const now = new Date();
      const timeString = now.toLocaleTimeString('en-IN', {
        hour: '2-digit',
        minute: '2-digit',
        timeZone: 'Asia/Kolkata',
      });
      setCurrentTime(timeString);
    };
    
    updateTime();
    const interval = setInterval(updateTime, 1000);
    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (mobileMenuRef.current && !mobileMenuRef.current.contains(e.target)) {
        setIsMobileMenuOpen(false);
        setActiveDropdown(null);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  useEffect(() => {
    document.body.style.overflow = isMobileMenuOpen ? "hidden" : "unset";
    return () => {
      document.body.style.overflow = "unset";
    };
  }, [isMobileMenuOpen]);

  /* ---------- Handlers ---------- */
  const handleLinkClick = () => {
    setIsMobileMenuOpen(false);
    setActiveDropdown(null);
  };
  const toggleDropdown = (index) => {
    setActiveDropdown(activeDropdown === index ? null : index);
  };

  /* ---------- Render ---------- */
  return (
    <>
      {/* Scroll Progress Bar */}
      <div 
        className="fixed top-0 left-0 h-1 bg-gradient-to-r from-[#ef2d2d] via-[#fcd116] to-[#009e49] z-[99] transition-all duration-150 ease-out"
        style={{ width: `${scrollProgress}%` }}
        aria-hidden="true"
      />

      {/* ===== TOP ANNOUNCEMENT BAR ===== */}
      <div className="bg-[#1e293b] text-white py-2.5 text-sm border-b border-gray-700">
        <div className="max-w-7xl mx-auto px-4 flex justify-between items-center">
          <span className="text-gray-300 hidden sm:inline">{h("topText")}</span>
          <span className="text-gray-300 sm:hidden">Embassy of Burkina Faso</span>
          
          <div className="flex items-center gap-3 sm:gap-4">
            {/* Live Time Display */}
            <div className="hidden lg:flex items-center gap-2 text-gray-400 text-xs">
              <FaClock className="w-3.5 h-3.5" />
              <span>New Delhi: <span className="text-white font-mono">{currentTime}</span></span>
            </div>
            
            {/* Language Selector - Desktop */}
            <div className="hidden md:flex items-center gap-2">
              <FaGlobe className="w-3.5 h-3.5 text-gray-400" />
              <select
                value={locale}
                onChange={(e) => changeLocale(e.target.value)}
                className="border border-gray-600 rounded px-3 py-1.5 text-sm cursor-pointer bg-gray-800 text-white hover:bg-gray-700 transition-colors focus:outline-none focus:ring-2 focus:ring-yellow"
                aria-label="Select language"
              >
                <option value="en">English</option>
                <option value="fr">Français</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      {/* Accent Border */}
      <div className="h-0.5 w-full bg-gradient-to-r from-red via-yellow to-[#009E49]"></div>

      {/* ===== MAIN HEADER ===== */}
      <header
        className={`sticky top-0 z-50 transition-all duration-300 ${isScrolled
            ? "bg-white shadow-md py-3"
            : "bg-slate-900 py-4"
          }`}
      >
        {/* Top Quick Links Bar - Desktop Only */}
        <div className={`hidden lg:block border-b ${isScrolled ? 'border-gray-200' : 'border-gray-800'} pb-2 mb-3`}>
          <div className="max-w-7xl mx-auto px-4 flex justify-end items-center gap-8">
            {/* Government Links */}
            <div className="flex items-center gap-6">
              {governmentLinks.map((link, index) => (
                <a
                  key={index}
                  href={link.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className={`text-xs flex items-center gap-2 transition-colors duration-200 group ${isScrolled
                      ? "text-gray-600 hover:text-[#009E49]"
                      : "text-gray-400 hover:text-white"
                    }`}
                >
                  <span>{h(link.key)}</span>
                  <FaExternalLinkAlt className="w-2.5 h-2.5 opacity-0 group-hover:opacity-100 transition-opacity" />
                </a>
              ))}
            </div>

            {/* Social Icons */}
            <div className="flex items-center gap-3 pl-6 border-l border-gray-700">
              {socialMediaLinks.map((social) => (
                <a
                  key={social.id}
                  href={social.link}
                  className={`transition-colors duration-200 ${isScrolled
                      ? "text-gray-500 hover:text-red"
                      : "text-gray-400 hover:text-white"
                    }`}
                  aria-label={s(social.key)}
                >
                  <social.icon className="w-3.5 h-3.5" />
                </a>
              ))}
            </div>
          </div>
        </div>

        {/* ===== MAIN NAVIGATION BAR ===== */}
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex justify-between items-center">
            {/* Logo */}
            <Link href="/" className="flex items-center gap-4 group">
              <div className="relative w-14 h-16 flex-shrink-0">
                <Image
                  src="/Armoiries_du_Burkina_Faso.png"
                  alt={h("altText")}
                  fill
                  className="object-contain drop-shadow-md"
                  priority
                />
              </div>
              <div className={`transition-colors duration-300 ${isScrolled ? "text-gray-800" : "text-white"}`}>
                <p className="text-xl font-bold font-serif leading-tight">
                  {h("embassyName")}
                </p>
                <p className="text-xs text-gray-500 uppercase tracking-wide">{h("subtitle")}</p>
              </div>
            </Link>

            {/* Desktop Navigation */}
            <nav className="hidden xl:flex items-center gap-1">
              {navigationItems.map((item, index) => {
                const active = item.type === 'link' ? isActive(item.href) : false;
                
                return (
                  <div key={index} className="relative group">
                    {item.type === "link" ? (
                      <Link
                        href={item.href}
                        className={`relative px-4 py-2 text-sm font-semibold transition-colors duration-200 ${
                          active 
                            ? 'text-red' 
                            : isScrolled 
                              ? "text-gray-700 hover:text-red" 
                              : "text-white hover:text-yellow"
                        }`}
                      >
                        {h(item.key)}
                        <span className={`absolute bottom-0 left-1/2 -translate-x-1/2 h-0.5 bg-red transition-all duration-300 ${
                          active ? 'w-full' : 'w-0 group-hover:w-3/4'
                        }`}></span>
                      </Link>
                    ) : (
                      <div className="relative">
                        <button
                          className={`px-4 py-2 text-sm font-semibold transition-colors duration-200 flex items-center gap-1.5 ${
                            isScrolled 
                              ? "text-gray-700 hover:text-red" 
                              : "text-white hover:text-yellow"
                          }`}
                        >
                          <span>{h(item.key)}</span>
                          <FaChevronDown className="w-3 h-3 transition-transform duration-300 group-hover:rotate-180" />
                        </button>
                        {/* Dropdown Menu */}
                        <div className="absolute top-full left-0 w-64 bg-white shadow-xl rounded-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 mt-2 overflow-hidden border border-gray-100 z-50">
                          {item.items.map((subItem, subIndex) => (
                            <Link
                              key={subIndex}
                              href={subItem.href}
                              className="block px-5 py-3 text-sm text-gray-700 hover:bg-gray-50 hover:text-red transition-colors duration-200 border-b border-gray-100 last:border-b-0"
                            >
                              {h(subItem.key)}
                            </Link>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                );
              })}
            </nav>

            {/* Mobile Menu Button */}
            <button
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              className={`xl:hidden p-2.5 rounded transition-colors duration-200 ${isScrolled
                  ? "bg-gray-100 text-gray-700 hover:bg-gray-200"
                  : "bg-gray-800 text-white hover:bg-gray-700"
                }`}
              aria-label="Toggle menu"
            >
              {isMobileMenuOpen ? (
                <FaTimes className="w-5 h-5" />
              ) : (
                <FaBars className="w-5 h-5" />
              )}
            </button>
          </div>
        </div>
      </header>

      {/* ===== MOBILE MENU OVERLAY ===== */}
      <div
        ref={mobileMenuRef}
        className={`xl:hidden fixed inset-0 bg-slate-900 transform transition-transform duration-300 ease-in-out z-50 ${isMobileMenuOpen ? "translate-x-0" : "translate-x-full"
          }`}
      >
        {/* Header */}
        <div className="bg-[#1e293b] border-b border-gray-800 p-5">
          <div className="flex justify-between items-center">
            <div className="flex items-center gap-3">
              <div className="relative w-10 h-12">
                <Image
                  src="/Armoiries_du_Burkina_Faso.png"
                  alt={h("altText")}
                  fill
                  className="object-contain"
                />
              </div>
              <div className="text-white">
                <h2 className="text-base font-bold">{h("embassyName")}</h2>
                <p className="text-xs text-gray-400">{h("subtitle")}</p>
              </div>
            </div>
            <button
              onClick={() => setIsMobileMenuOpen(false)}
              className="text-white p-2 hover:bg-gray-800 rounded transition-colors"
              aria-label="Close menu"
            >
              <FaTimes className="w-5 h-5" />
            </button>
          </div>
          
          {/* Language Selector - Mobile */}
          <div className="mt-4 flex items-center gap-3">
            <FaGlobe className="w-4 h-4 text-gray-400" />
            <select
              value={locale}
              onChange={(e) => changeLocale(e.target.value)}
              className="flex-1 bg-gray-800 text-white text-sm rounded px-3 py-2 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-yellow"
              aria-label="Select language"
            >
              <option value="en">English</option>
              <option value="fr">Français</option>
            </select>
          </div>
          
          {/* Live Time - Mobile */}
          <div className="mt-2 flex items-center gap-2 text-gray-400 text-xs">
            <FaClock className="w-3.5 h-3.5" />
            <span>New Delhi: <span className="text-white font-mono">{currentTime}</span></span>
          </div>
        </div>

        {/* Navigation */}
        <div className="flex flex-col h-full pt-4 pb-6 px-5 overflow-y-auto">
          <nav className="space-y-1 mb-8">
            {navigationItems.map((item, index) => {
              const active = item.type === 'link' ? isActive(item.href) : false;
              
              return (
                <div
                  key={index}
                  className="border-b border-gray-800 last:border-b-0"
                >
                  {item.type === "link" ? (
                    <Link
                      href={item.href}
                      className={`block py-3.5 text-base font-semibold transition-colors duration-200 ${
                        active 
                          ? 'text-yellow border-l-4 border-yellow pl-3' 
                          : 'text-white hover:text-yellow pl-3'
                      }`}
                      onClick={handleLinkClick}
                    >
                      {h(item.key)}
                    </Link>
                  ) : (
                    <div>
                      <button
                        onClick={() => toggleDropdown(index)}
                        className="flex justify-between items-center w-full py-3.5 text-base font-semibold text-white hover:text-yellow transition-colors duration-200 pl-3"
                      >
                        <span>{h(item.key)}</span>
                        <FaChevronDown
                          className={`w-3.5 h-3.5 transition-transform duration-300 ${activeDropdown === index ? "rotate-180" : ""
                            }`}
                        />
                      </button>
                      <div
                        className={`overflow-hidden transition-all duration-300 ${activeDropdown === index
                            ? "max-h-48 opacity-100"
                            : "max-h-0 opacity-0"
                          }`}
                      >
                        <div className="pb-3 pl-4 space-y-2">
                          {item.items.map((subItem, subIndex) => (
                            <Link
                              key={subIndex}
                              href={subItem.href}
                              className="block py-2 text-sm text-gray-400 hover:text-yellow transition-colors duration-200"
                              onClick={handleLinkClick}
                            >
                              {h(subItem.key)}
                            </Link>
                          ))}
                        </div>
                      </div>
                    </div>
                  )}
                </div>
              );
            })}
          </nav>
            ))}
          </nav>

          {/* Quick Actions */}
          <div className="mb-8 space-y-3">
            <Link
              href="/contact"
              className="block w-full bg-red hover:bg-[#d42626] text-white text-center py-3.5 rounded font-semibold shadow-lg transition-colors duration-200"
              onClick={handleLinkClick}
            >
              {h("emergencyContact")}
            </Link>
            <button className="w-full bg-gray-800 hover:bg-gray-700 text-white text-center py-3.5 rounded font-semibold border border-gray-700 transition-colors duration-200">
              {h("bookAppointment")}
            </button>
          </div>

          {/* Government Links */}
          <div className="mb-8">
            <h3 className="text-yellow font-semibold mb-4 text-sm uppercase tracking-wider">
              {h("usefulLinks")}
            </h3>
            <div className="space-y-3">
              {governmentLinks.map((link, index) => (
                <a
                  key={index}
                  href={link.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex text-gray-400 hover:text-white text-sm transition-colors duration-200 items-center gap-3 py-1"
                >
                  <FaExternalLinkAlt className="w-3 h-3" />
                  <span>{h(link.key)}</span>
                </a>
              ))}
            </div>
          </div>

          {/* Contact */}
          <div className="mb-8">
            <h3 className="text-yellow font-semibold mb-4 text-sm uppercase tracking-wider">
              {h("contact")}
            </h3>
            <div className="space-y-3">
              <div className="flex items-center gap-3 text-gray-400">
                <FaPhone className="w-3.5 h-3.5" />
                <div>
                  <div className="font-semibold text-white text-sm">+91 11 2611 2390</div>
                  <div className="text-xs text-gray-500">{h("standardHours")}</div>
                </div>
              </div>
              <div className="flex items-center gap-3 text-gray-400">
                <FaPhone className="w-3.5 h-3.5" />
                <div>
                  <div className="font-semibold text-white text-sm">+91 98 111 44440</div>
                  <div className="text-xs text-gray-500">{h("emergencyLine")}</div>
                </div>
              </div>
              <div className="flex items-center gap-3 text-gray-400 text-sm">
                <FaEnvelope className="w-3.5 h-3.5" />
                <span>embassy.newdelhi@burkinafaso.gov.bf</span>
              </div>
              <div className="flex items-center gap-3 text-gray-400 text-sm">
                <FaMapMarkerAlt className="w-3.5 h-3.5" />
                <span>{h("address")}</span>
              </div>
            </div>
          </div>

          {/* Social */}
          <div>
            <h3 className="text-yellow font-semibold mb-4 text-sm uppercase tracking-wider">
              {h("follow")}
            </h3>
            <div className="flex gap-3">
              {socialMediaLinks.map((social) => (
                <a
                  key={social.id}
                  href={social.link}
                  className="p-3 bg-gray-800 rounded text-white hover:bg-gray-700 transition-colors duration-200"
                  aria-label={s(social.key)}
                >
                  <social.icon className="w-4 h-4" />
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Mobile Backdrop */}
      {isMobileMenuOpen && (
        <div
          className="xl:hidden fixed inset-0 bg-black/50 backdrop-blur-sm z-40"
          onClick={() => setIsMobileMenuOpen(false)}
        />
      )}
    </>
  );
};

export default Header;