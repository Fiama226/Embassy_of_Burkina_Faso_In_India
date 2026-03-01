interface BilateralSectionProps {
  title: string;
  text: string;
}

export function BilateralSection({ title, text }: BilateralSectionProps) {
  return (
    <section
      aria-labelledby="bilateral-heading"
      className="
        bg-stone-900 rounded-xl shadow-xl text-white
        p-10 lg:p-12 relative overflow-hidden
        border-t-4 border-red-700
      "
    >
      <div className="relative z-10 max-w-4xl mx-auto text-center">
        <h2
          id="bilateral-heading"
          className="text-2xl lg:text-4xl font-serif font-bold mb-6 text-amber-50"
        >
          {title}
        </h2>
        <p className="text-lg text-stone-200 leading-relaxed">
          {text}
        </p>
      </div>

      {/* Decorative background */}
      <div
        className="
          absolute top-0 right-0 w-64 h-64
          bg-white/5 rounded-full
          -translate-y-1/2 translate-x-1/2 blur-3xl
        "
        aria-hidden="true"
      />
    </section>
  );
}