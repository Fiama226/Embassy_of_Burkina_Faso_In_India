import type { CooperationItem } from "../typescooperation";

interface CooperationCardProps {
  item: CooperationItem;
  achievementsLabel: string;
}

export function CooperationCard({
  item,
  achievementsLabel,
}: CooperationCardProps) {
  const Icon = item.icon;

  return (
    <article className="bg-white rounded-xl shadow-sm hover:shadow-lg transition-all duration-300 border border-stone-200 overflow-hidden group">
      <div className="p-8">
        {/* Header */}
        <div className="flex items-start gap-4 mb-6">
          <div
            className="
              w-12 h-12 rounded-full bg-amber-50 flex-shrink-0
              flex items-center justify-center
              border border-amber-100 group-hover:border-amber-300
              transition-colors
            "
          >
            <Icon className="text-xl text-amber-700" aria-hidden="true" />
          </div>
          <div className="flex-1 min-w-0">
            <h3 className="text-xl font-serif font-bold text-stone-900 mb-1">
              {item.title}
            </h3>
            <p className="text-stone-600 leading-relaxed text-sm">
              {item.description}
            </p>
          </div>
        </div>

        {/* Key stat */}
        <div
          className="
            flex items-center gap-3 mb-6 p-3 rounded-lg
            bg-gradient-to-r from-amber-50 to-stone-50
            border border-amber-100
          "
        >
          <span className="text-2xl font-bold text-amber-700 tabular-nums">
            {item.stat}
          </span>
          <span className="text-sm text-stone-600">{item.statLabel}</span>
        </div>

        {/* Achievements */}
        <div className="bg-stone-50 rounded-lg p-5 border border-stone-100">
          <h4 className="text-xs font-bold uppercase tracking-wider text-stone-400 mb-3">
            {achievementsLabel}
          </h4>
          <ul className="space-y-2.5" role="list">
            {item.achievements.map((ach, i) => (
              <li
                key={i}
                className="flex items-center gap-3 text-sm text-stone-700"
              >
                <span
                  className="w-1.5 h-1.5 rounded-full bg-red-600 flex-shrink-0"
                  aria-hidden="true"
                />
                {ach}
              </li>
            ))}
          </ul>
        </div>
      </div>
    </article>
  );
}