import { FaGlobe } from "react-icons/fa";

interface ConsularHeaderProps {
  title: string;
  subtitle: string;
  badge: string;
}

export function ConsularHeader({ title, subtitle, badge }: ConsularHeaderProps) {
  return (
    <header className="text-center mb-16">
      <div className="inline-flex items-center gap-2 bg-gradient-to-r from-slate-800 to-slate-700 text-white px-5 py-2.5 rounded-full text-sm font-medium mb-6 shadow-lg">
        <FaGlobe className="w-4 h-4" aria-hidden="true" />
        <span>{badge}</span>
      </div>

      <h1 className="text-4xl lg:text-6xl font-bold font-serif text-slate-900 mb-6 tracking-tight">
        {title}
      </h1>

      {/* Decorative divider — hidden from assistive tech */}
      <div
        className="flex items-center justify-center gap-3 mb-6"
        aria-hidden="true"
      >
        <span className="h-px w-16 bg-gradient-to-r from-transparent via-slate-300 to-transparent" />
        <span className="w-2 h-2 rounded-full bg-gradient-to-r from-rose-600 via-amber-500 to-emerald-600" />
        <span className="h-px w-16 bg-gradient-to-r from-transparent via-slate-300 to-transparent" />
      </div>

      <p className="text-lg text-slate-600 max-w-3xl mx-auto leading-relaxed">
        {subtitle}
      </p>
    </header>
  );
}