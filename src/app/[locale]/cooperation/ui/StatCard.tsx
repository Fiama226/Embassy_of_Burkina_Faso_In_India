import type { Statistic } from "../typescooperation";

interface StatCardProps {
  stat: Statistic;
}

export function StatCard({ stat }: StatCardProps) {
  const Icon = stat.icon;

  return (
    <div className="bg-stone-50 rounded-lg p-4 text-center border border-stone-100 shadow-sm hover:shadow-md transition-shadow">
      <Icon
        className="text-2xl mx-auto mb-3 text-amber-600"
        aria-hidden="true"
      />
      <div className="text-xl font-bold text-stone-900 tabular-nums">
        {stat.value}
      </div>
      <div className="text-xs uppercase tracking-wider text-stone-500 mt-1">
        {stat.label}
      </div>
    </div>
  );
}