import { FaCheckCircle } from "react-icons/fa";

interface RequirementListProps {
  items: string[];
  columns?: 1 | 2;
  className?: string;
}

export function RequirementList({
  items,
  columns = 1,
  className = "",
}: RequirementListProps) {
  return (
    <ul
      role="list"
      className={`
        ${columns === 2 ? "grid sm:grid-cols-2 gap-3" : "space-y-3"}
        ${className}
      `}
    >
      {items.map((item, i) => (
        <li key={i} className="flex items-start gap-3">
          <FaCheckCircle
            className="text-emerald-500 mt-0.5 flex-shrink-0 w-4 h-4"
            aria-hidden="true"
          />
          <span className="text-slate-700 text-sm leading-relaxed">
            {item}
          </span>
        </li>
      ))}
    </ul>
  );
}