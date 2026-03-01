import type { VisaFee } from "@/types/consular";

interface VisaFeesTableProps {
  title: string;
  fees: VisaFee[];
  caption: string;
  headerDuration: string;
  headerFee: string;
}

export function VisaFeesTable({
  title,
  fees,
  caption,
  headerDuration,
  headerFee,
}: VisaFeesTableProps) {
  return (
    <div>
      <p className="font-semibold text-amber-400 mb-3">{title}</p>

      <table className="w-full">
        <caption className="sr-only">{caption}</caption>
        <thead>
          <tr>
            <th className="text-left text-slate-400 text-xs font-medium pb-2 uppercase tracking-wider">
              {headerDuration}
            </th>
            <th className="text-right text-slate-400 text-xs font-medium pb-2 uppercase tracking-wider">
              {headerFee}
            </th>
          </tr>
        </thead>
        <tbody className="divide-y divide-white/10">
          {fees.map((fee, i) => (
            <tr key={i} className="hover:bg-white/5 transition-colors">
              <td className="py-3 text-slate-300 text-sm">
                {fee.duration}
              </td>
              <td className="py-3 text-white font-bold text-right tabular-nums">
                {fee.price}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}