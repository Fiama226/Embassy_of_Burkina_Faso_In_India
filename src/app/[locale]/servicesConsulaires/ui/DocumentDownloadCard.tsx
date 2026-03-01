import Image from "next/image";
import { FaDownload } from "react-icons/fa";

interface DocumentDownloadCardProps {
  href: string;
  imageSrc: string;
  imageAlt: string;
  label: string;
  buttonColor?: string;
  compact?: boolean;
}

export function DocumentDownloadCard({
  href,
  imageSrc,
  imageAlt,
  label,
  buttonColor = "bg-slate-900 hover:bg-slate-800",
  compact = false,
}: DocumentDownloadCardProps) {
  return (
    <figure className="flex flex-col w-full max-w-md">
      {/* Preview image — always has a visible gradient so users
          know it's interactive even on touch devices */}
      <a
        href={href}
        download
        aria-label={`${label} (PDF)`}
        className="
          group block rounded-2xl overflow-hidden shadow-lg
          hover:shadow-2xl transition-all duration-300 hover:-translate-y-1
          focus-visible:outline-none focus-visible:ring-2
          focus-visible:ring-blue-600 focus-visible:ring-offset-2
        "
      >
        <div className="relative">
          <Image
            src={imageSrc}
            alt={imageAlt}
            width={500}
            height={compact ? 350 : 650}
            className="w-full object-cover h-full"
          />
          <div
            className="
              absolute inset-0 bg-gradient-to-t
              from-slate-900/50 to-transparent
              group-hover:from-slate-900/70
              transition-all duration-300
            "
            aria-hidden="true"
          />
        </div>
      </a>

      {/* ✅ Always-visible download button — works on mobile */}
      <a
        href={href}
        download
        className={`
          mt-4 flex items-center justify-center gap-2
          ${buttonColor} text-white px-6 py-3 rounded-xl
          font-semibold transition-colors
          focus-visible:outline-none focus-visible:ring-2
          focus-visible:ring-blue-600 focus-visible:ring-offset-2
        `}
      >
        <FaDownload className="w-4 h-4" aria-hidden="true" />
        <span>{label}</span>
      </a>
    </figure>
  );
}