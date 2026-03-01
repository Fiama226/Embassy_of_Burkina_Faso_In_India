import { useTranslations } from "next-intl";
import { StaffCard } from "../ui/StaffCard";
import type { StaffMember } from "../types/about";

interface StaffSectionProps {
  staff: StaffMember[];
}

const TIER_ORDER: StaffMember["tier"][] = [
  "leadership",
  "diplomatic",
  "administrative",
  "support",
];

export function StaffSection({ staff }: StaffSectionProps) {
  const t = useTranslations("AboutPage.staff");

  // ✅ Group by tier for visual hierarchy
  const grouped = TIER_ORDER.map((tier) => ({
    tier,
    label: t(`tier_labels.${tier}`),
    members: staff.filter((m) => m.tier === tier),
  })).filter((g) => g.members.length > 0);

  return (
    <div className="space-y-12">
      <header className="text-center">
        <h2 className="text-3xl lg:text-4xl font-serif font-bold text-stone-900 mb-4">
          {t("title")}
        </h2>
        <div
          className="h-1 w-24 bg-red-600 mx-auto rounded-full"
          aria-hidden="true"
        />
      </header>

      {grouped.map((group) => (
        <section
          key={group.tier}
          aria-labelledby={`tier-${group.tier}`}
        >
          <h3
            id={`tier-${group.tier}`}
            className="text-sm font-bold uppercase tracking-widest text-stone-400 mb-6 px-1"
          >
            {group.label}
          </h3>

          <div
            className={`
              grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 max-w-2xl

   
            `}
          >
            {group.members.map((member) => (
              <StaffCard key={member.id} member={member} />
            ))}
          </div>
        </section>
      ))}
    </div>
  );
}