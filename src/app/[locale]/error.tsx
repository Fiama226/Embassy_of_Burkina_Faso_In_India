"use client";

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useTranslations } from 'next-intl';

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  const router = useRouter();
  const t = useTranslations('Error');

  useEffect(() => {
    console.error(error);
  }, [error]);

  return (
    <div className="flex flex-col items-center justify-center min-h-screen px-4">
      <div className="text-center">
        <h1 className="text-6xl font-bold text-red-600 mb-4">500</h1>
        <h2 className="text-2xl font-semibold text-gray-900 mb-4">
          {t('title') || 'Something went wrong!'}
        </h2>
        <p className="text-gray-600 mb-8 max-w-md">
          {t('description') || 'We apologize for the inconvenience. Please try again.'}
        </p>
        <div className="space-x-4">
          <button
            onClick={() => reset()}
            className="bg-red-600 text-white px-6 py-2 rounded-md hover:bg-red-700 transition-colors"
          >
            {t('tryAgain') || 'Try Again'}
          </button>
          <button
            onClick={() => router.push('/')}
            className="bg-gray-600 text-white px-6 py-2 rounded-md hover:bg-gray-700 transition-colors"
          >
            {t('goHome') || 'Go Home'}
          </button>
        </div>
      </div>
    </div>
  );
}