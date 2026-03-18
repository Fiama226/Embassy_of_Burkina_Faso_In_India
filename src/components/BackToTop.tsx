'use client';

import { useState, useEffect } from 'react';
import { FaArrowUp } from 'react-icons/fa';

/**
 * BackToTop Component
 * 
 * A floating button that appears after scrolling down,
 * allowing users to quickly scroll back to the top.
 * 
 * Features:
 * - Appears after 400px scroll
 * - Smooth scroll animation
 * - Gradient background with Burkina Faso colors
 * - Accessible with keyboard navigation
 * - Responsive positioning
 */
export function BackToTop() {
  const [isVisible, setIsVisible] = useState(false);
  const [scrollProgress, setScrollProgress] = useState(0);

  useEffect(() => {
    const handleScroll = () => {
      const totalHeight = document.documentElement.scrollHeight - window.innerHeight;
      const progress = (window.scrollY / totalHeight) * 100;
      
      setScrollProgress(progress);
      setIsVisible(window.scrollY > 400);
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    });
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault();
      scrollToTop();
    }
  };

  return (
    <>
      {/* Scroll Progress Bar */}
      <div 
        className="fixed top-0 left-0 h-1 bg-gradient-to-r from-[#ef2d2d] via-[#fcd116] to-[#009e49] z-[9999] transition-all duration-150 ease-out"
        style={{ width: `${scrollProgress}%` }}
        aria-hidden="true"
      />

      {/* Back to Top Button */}
      <button
        onClick={scrollToTop}
        onKeyDown={handleKeyDown}
        aria-label="Back to top"
        className={`
          fixed
          bottom-6
          right-6
          sm:bottom-8
          sm:right-8
          w-12 h-12
          sm:w-14 sm:h-14
          rounded-full
          bg-gradient-to-br from-[#ef2d2d] to-[#ef2d2d]/90
          text-white
          shadow-lg
          hover:shadow-xl
          hover:scale-110
          active:scale-95
          transition-all
          duration-300
          ease-out
          z-[9998]
          flex
          items-center
          justify-center
          border-2
          border-white/20
          focus:outline-none
          focus:ring-2
          focus:ring-[#ef2d2d]
          focus:ring-offset-2
          ${isVisible 
            ? 'opacity-100 translate-y-0 pointer-events-auto' 
            : 'opacity-0 translate-y-10 pointer-events-none'
          }
        `}
      >
        <FaArrowUp 
          className="w-5 h-5 sm:w-6 sm:h-6"
          aria-hidden="true"
        />
      </button>
    </>
  );
}
