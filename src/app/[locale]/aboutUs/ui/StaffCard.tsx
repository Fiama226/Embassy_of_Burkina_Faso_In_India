import Image from "next/image";
import type { StaffMember } from "../types/about";

interface StaffCardProps {
  member: StaffMember;
}

const TIER_STYLES = {
  leadership: "ring-2 ring-amber-400 shadow-lg",
  diplomatic: "ring-1 ring-stone-200",
  administrative: "ring-1 ring-stone-200",
  support: "ring-1 ring-stone-200",
} as const;

const TIER_BADGE = {
  leadership: "bg-amber-600",
  diplomatic: "bg-red-700",
  administrative: "bg-stone-600",
  support: "bg-stone-500",
} as const;

export function StaffCard({ member }: StaffCardProps) {
  return (
    <article
      className={`
        group bg-white rounded-xl overflow-hidden
        border border-stone-200
        hover:shadow-lg transition-all duration-300
        w-75
        ${TIER_STYLES[member.tier]}
      `}
    >
      {/* Photo */}
      <div className="relative h-64 w-full bg-stone-100 overflow-hidden">
        <Image
          src={`/employee_photo/${member.image}`}
          alt={`Portrait of ${member.name}`}
          fill
          className="object-cover object-top group-hover:scale-105 transition-transform duration-500"
          sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 25vw"
          loading="lazy"
        />
      </div>

      {/* Info */}
      <div className="p-5 text-center">
        <h3 className="font-serif font-bold text-lg text-stone-900 mb-2">
          {member.name}
        </h3>
        <div
          className={`
            inline-block px-3 py-1 rounded-full text-xs font-semibold
            uppercase tracking-wide text-white
            ${TIER_BADGE[member.tier]}
          `}
        >
          {member.role}
        </div>
      </div>
    </article>
  );
}