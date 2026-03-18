import createMiddleware from 'next-intl/middleware';
import { NextRequest, NextResponse } from 'next/server';
import { routing } from './i18n/routing';

// Create the next-intl middleware
const nextIntlMiddleware = createMiddleware(routing);

/**
 * Main Middleware Function
 * 
 * Combines next-intl routing with security headers
 */
export default function middleware(request: NextRequest) {
  // Run next-intl middleware first
  const response = nextIntlMiddleware(request);

  // Add security headers
  addSecurityHeaders(response);

  return response;
}

/**
 * Add Security Headers to Response
 * 
 * Implements security best practices for:
 * - Clickjacking protection (X-Frame-Options)
 * - MIME type sniffing prevention (X-Content-Type-Options)
 * - XSS protection (X-XSS-Protection)
 * - Referrer policy control
 * - Permissions Policy
 * - Content Security Policy (CSP)
 */
function addSecurityHeaders(response: NextResponse) {
  // Prevent clickjacking attacks
  response.headers.set('X-Frame-Options', 'SAMEORIGIN');

  // Prevent MIME type sniffing
  response.headers.set('X-Content-Type-Options', 'nosniff');

  // XSS Protection (legacy but still useful)
  response.headers.set('X-XSS-Protection', '1; mode=block');

  // Control referrer information
  response.headers.set(
    'Referrer-Policy',
    'strict-origin-when-cross-origin'
  );

  // Permissions Policy - Control browser features
  response.headers.set(
    'Permissions-Policy',
    [
      'accelerometer=()',
      'camera=()',
      'geolocation=(self)',
      'gyroscope=()',
      'magnetometer=()',
      'microphone=()',
      'payment=()',
      'usb=()',
    ].join(', ')
  );

  // Content Security Policy
  // Note: Adjust these directives based on your actual needs
  response.headers.set(
    'Content-Security-Policy',
    [
      "default-src 'self'",
      "script-src 'self' 'unsafe-eval' 'unsafe-inline' https://www.googletagmanager.com",
      "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com",
      "img-src 'self' data: https: blob:",
      "font-src 'self' https://fonts.gstatic.com",
      "connect-src 'self' https://api.cloudinary.com",
      "frame-src 'self' https://www.google.com",
      "object-src 'none'",
      "base-uri 'self'",
      "form-action 'self'",
      "frame-ancestors 'self'",
      process.env.NODE_ENV === 'production' ? "upgrade-insecure-requests" : "",
    ].filter(Boolean).join('; ')
  );

  // Cache control for HTML pages
  response.headers.set(
    'Cache-Control',
    'public, s-maxage=60, stale-while-revalidate=300'
  );
}

export const config = {
  // Match only internationalized pathnames
  matcher: [
    '/',
    '/(fr|en)/:path*',
    // Exclude static files, API routes, and files with extensions
    '/((?!api|_next|_vercel|admin|.*\\..*).*)',
  ],
};
