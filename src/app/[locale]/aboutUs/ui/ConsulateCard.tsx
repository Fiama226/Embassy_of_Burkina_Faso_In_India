import Image from "next/image";
import {
  FaMapMarkerAlt,
  FaUser,
  FaPhone,
} from "react-icons/fa";
import type { ConsulateInfo } from "../types/about";

interface ConsulateCardProps {
  consulate: ConsulateInfo;
  addressLabel: string;
  consulLabel: string;
  phoneLabel: string;
}

const ACCENT = {
  red: {
    iconBg: "bg-red-50",
    iconText: "text-red-600",
  },
  green: {
    iconBg: "bg-green-50",
    iconText: "text-green-600",
  },
} as const;

export function ConsulateCard({
  consulate,
  addressLabel,
  consulLabel,
  phoneLabel,
}: ConsulateCardProps) {
  const accent = ACCENT[consulate.accent];

  return (
    <article className="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden hover:shadow-lg transition-shadow duration-300">
      {/* Flag Header */}
      <div className="relative h-48 w-full border-b border-stone-100">
        <Image
          src={consulate.flagSrc}
          fill
          className=""
          alt={`${consulate.country} flag`}
          sizes="(max-width: 1024px) 100%, 100%"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent" />
        <div className="absolute bottom-0 left-0 w-full p-5">
          <h3 className="text-2xl font-bold text-white font-serif">
            {consulate.title}
          </h3>
        </div>
      </div>

      {/* Details */}
      <div className="p-6 space-y-5">
        {/* Address */}
        <div className="flex items-start gap-4">
          <div
            className={`${accent.iconBg} p-2.5 rounded-full ${accent.iconText} flex-shrink-0`}
          >
            <FaMapMarkerAlt className="w-5 h-5" aria-hidden="true" />
          </div>
          <div>
            <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mb-1">
              {addressLabel}
            </p>
            <p className="text-stone-800 font-medium leading-relaxed text-sm">
              {consulate.address}
            </p>
          </div>
        </div>

        {/* Phone */}
        <div className="flex items-start gap-4">
          <div
            className={`${accent.iconBg} p-2.5 rounded-full ${accent.iconText} flex-shrink-0`}
          >
            <FaPhone className="w-5 h-5" aria-hidden="true" />
          </div>
          <div>
            <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mb-1">
              {phoneLabel}
            </p>
            <a
              href={`tel:${consulate.phone}`}
              className="text-stone-800 font-medium hover:text-red-700 transition-colors"
            >
              {consulate.phone}
            </a>
          </div>
        </div>

        {/* Consul */}
        <div className="flex items-start gap-4">
          <div
            className={`${accent.iconBg} p-2.5 rounded-full ${accent.iconText} flex-shrink-0`}
          >
            <FaUser className="w-5 h-5" aria-hidden="true" />
          </div>
          <div>
            <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mb-1">
              {consulLabel}
            </p>
            <p className="text-stone-800 font-medium">
              {consulate.consulName}
            </p>
          </div>
        </div>
      </div>
    </article>
  );
}