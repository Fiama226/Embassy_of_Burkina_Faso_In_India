import type { IconType } from "react-icons";

interface ContactItemProps {
  icon: IconType;
  label: string;
  value: string;
  href?: string;
}

export function ContactItem({
  icon: Icon,
  label,
  value,
  href,
}: ContactItemProps) {
  const ValueTag = href ? "a" : "span";

  return (
    <div className="flex items-start gap-3">
      <div
        className="w-10 h-10 rounded-lg bg-red-50 flex items-center justify-center flex-shrink-0"
        aria-hidden="true"
      >
        <Icon className="w-5 h-5 text-red-700" />
      </div>
      <div>
        <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mb-0.5">
          {label}
        </p>
        <ValueTag
          {...(href
            ? {
                href,
                className:
                  "text-stone-800 font-medium hover:text-red-700 transition-colors focus-visible:outline-none focus-visible:underline",
              }
            : { className: "text-stone-800 font-medium" })}
        >
          {value}
        </ValueTag>
      </div>
    </div>
  );
}