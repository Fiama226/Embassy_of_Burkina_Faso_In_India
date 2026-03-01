import type { ServiceSection } from "@/types/consular";

interface QuickNavProps {
  sections: ServiceSection[];
  activeSection: string | null;
  onNavigate: (id: string) => void;
}

export function QuickNav({
  sections,
  activeSection,
  onNavigate,
}: QuickNavProps) {
  return (
    <nav
      aria-label="Service categories"
      className="flex flex-wrap justify-center gap-3 mb-12"
    >
      {sections.map((section) => {
        const Icon = section.icon;
        const isActive = activeSection === section.id;

        return (
          <button
            key={section.id}
            onClick={() => onNavigate(section.id)}
            aria-current={isActive ? "true" : undefined}
            className={`
              flex items-center gap-2 px-4 py-2.5 rounded-full
              text-sm font-medium transition-all duration-200
              focus-visible:outline-none focus-visible:ring-2
              focus-visible:ring-blue-600 focus-visible:ring-offset-2
              ${
                isActive
                  ? "bg-slate-900 text-white shadow-lg"
                  : "bg-white text-slate-700 border border-slate-200 hover:border-slate-400 hover:bg-slate-50 shadow-sm"
              }
            `}
          >
            <Icon className="w-4 h-4" aria-hidden="true" />
            <span>{section.title}</span>
          </button>
        );
      })}
    </nav>
  );
}