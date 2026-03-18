// ============================================

export default function HeroSection() {
  const t = useTranslations("Homepage.Hero");

  return (
    <section
      aria-labelledby="hero-heading"
      className="relative bg-gradient-to-b from-stone-50 to-white py-8 sm:py-12 lg:py-20 overflow-hidden"
    >
      {/* Decorative blobs */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none" aria-hidden="true">
        <div className="absolute -top-32 -right-32 w-60 h-60 sm:w-96 sm:h-96 bg-amber-50 rounded-full blur-3xl opacity-50" />
        <div className="absolute -bottom-32 -left-32 w-60 h-60 sm:w-96 sm:h-96 bg-stone-100 rounded-full blur-3xl opacity-50" />
      </div>

      <div className="relative max-w-7xl mx-auto px-2 sm:px-4 md:px-6 lg:px-8">
        <div className="flex flex-col lg:flex-row gap-8 sm:gap-10 lg:gap-14 items-center">
          {/* ── Left Column ────────────────────────────── */}
          <div className="w-full lg:w-1/2 text-center lg:text-left">
            {/* Badge */}
            <div className="inline-flex items-center gap-2.5 bg-stone-900 text-white px-3 sm:px-4 py-2 rounded-full text-xs font-bold uppercase tracking-widest mb-6 sm:mb-8 shadow-lg">
              <Image src={"/flags/Flag_of_Burkina_Faso.svg"} alt={"badge"} width={24} height={24} className="object-cover rounded-full" />
              <span>{t("badge")}</span>
            </div>

            {/* Title */}
            <h1
              id="hero-heading"
              className="text-3xl sm:text-4xl lg:text-5xl xl:text-6xl font-bold font-serif text-stone-900 mb-3 sm:mb-4 leading-[1.15]"
            >
              {t("title")}
            </h1>

            {/* Subtitle */}
            <p className="text-base sm:text-lg text-stone-600 leading-relaxed mb-4 sm:mb-5 max-w-xl mx-auto lg:mx-0">
              {t("subtitle")}
            </p>

            {/* Decorative divider */}
            <div className="flex items-center mb-6 sm:mb-8 justify-center lg:justify-start" aria-hidden="true">
              <span className="h-px w-8 sm:w-12" />
              <Image src={'/burkina_faso_flag_with_flagpole_256.png'} className="w-10 h-10 sm:w-12 sm:h-12 object-contain" width={48} height={48} alt={t("bf_flag_alt")}/>
              <span className="h-px w-8 sm:w-12" />
            </div>

            {/* ── Time Cards (isolated re-renders) ────── */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 sm:gap-4 max-w-xs sm:max-w-lg mx-auto lg:mx-0">
              <TimeCard
                flagSrc="/flags/Flag_of_Burkina_Faso.svg"
                flagAlt={t("bf_flag_alt")}
                city={t("bf_city")}
                country={t("bf_country")}
                timezone="Africa/Ouagadougou"
                localTimeLabel={t("local_time")}
              />

                        {/* ── Time Cards (isolated re-renders) ────── */}
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 sm:gap-4 max-w-xs sm:max-w-lg mx-auto lg:mx-0">
                          <TimeCard
                            flagSrc="/flags/Flag_of_India.svg"
                            flagAlt={t("india_flag_alt")}
                            city={t("india_city")}
                            country={t("india_country")}
                            timezone="Asia/Kolkata"
                            localTimeLabel={t("local_time")}
                          />
                          <TimeCard
                            flagSrc="/flags/Flag_of_Burkina_Faso.svg"
                            flagAlt={t("bf_flag_alt")}
                            city={t("bf_city")}
                            country={t("bf_country")}
                            timezone="Africa/Ouagadougou"
                            localTimeLabel={t("local_time")}
                          />
                        </div>
                      </div>

                      {/* ── Right Column (Carousel) ───────────────── */}
                      <div className="w-full lg:w-1/2 group">
                        <ImageCarousel
                          galleryLabel={t("carousel.label")}
                          slideLabel={t("carousel.slide")}
                          pauseLabel={t("carousel.pause")}
                          playLabel={t("carousel.play")}
                        />

                        {/* Caption below carousel */}
                        <p className="text-center text-xs text-stone-400 mt-2 sm:mt-3 uppercase tracking-widest font-medium">
                          {t("carousel.caption")}
                        </p>
                      </div>
                    </div>
                  </div>
                </section>
              {formattedDate}
            </p>
            <p
              className="text-xl font-mono font-bold text-stone-900 text-center tracking-wider tabular-nums"
              aria-live="off"
              // aria-live="off" — don't announce time changes to screen readers
            >
              {formattedTime}
            </p>
          </>
        ) : (
          // ✅ Skeleton while hydrating — avoids layout shift
          <div className="space-y-1.5 animate-pulse">
            <div className="h-3 bg-stone-200 rounded w-3/4 mx-auto" />
            <div className="h-6 bg-stone-200 rounded w-1/2 mx-auto" />
          </div>
        )}
      </div>
    </article>
  );
});

// ── ImageCarousel (zero external dependencies) ─────────────
interface CarouselProps {
  galleryLabel: string;
  slideLabel: string;
  pauseLabel: string;
  playLabel: string;
}

function ImageCarousel({
  galleryLabel,
  slideLabel,
  pauseLabel,
  playLabel,
}: CarouselProps) {
  const t = useTranslations("Homepage.Hero");
  const [current, setCurrent] = useState(0);
  const [isPaused, setIsPaused] = useState(false);
  const [isHovered, setIsHovered] = useState(false);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const total = GALLERY_IMAGES.length;

  // ── Autoplay ──────────────────────────────────────────
  const startAutoplay = useCallback(() => {
    if (timerRef.current) clearInterval(timerRef.current);
    timerRef.current = setInterval(() => {
      setCurrent((prev) => (prev + 1) % total);
    }, AUTOPLAY_INTERVAL);
  }, [total]);

  const stopAutoplay = useCallback(() => {
    if (timerRef.current) {
      clearInterval(timerRef.current);
      timerRef.current = null;
    }
  }, []);

  useEffect(() => {
    if (!isPaused && !isHovered) {
      startAutoplay();
    } else {
      stopAutoplay();
    }
    return stopAutoplay;
  }, [isPaused, isHovered, startAutoplay, stopAutoplay]);

  // ── Navigation ────────────────────────────────────────
  const goTo = useCallback(
    (index: number) => {
      setCurrent(((index % total) + total) % total);
      if (!isPaused) startAutoplay(); // Reset timer on manual nav
    },
    [total, isPaused, startAutoplay]
  );

  const goNext = useCallback(() => goTo(current + 1), [current, goTo]);
  const goPrev = useCallback(() => goTo(current - 1), [current, goTo]);

  // ── Keyboard ──────────────────────────────────────────
  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent) => {
      if (e.key === "ArrowRight") {
        e.preventDefault();
        goNext();
      } else if (e.key === "ArrowLeft") {
        e.preventDefault();
        goPrev();
      }
    },
    [goNext, goPrev]
  );

  return (
    <div
      role="region"
      aria-roledescription="carousel"
      aria-label={galleryLabel}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
      onKeyDown={handleKeyDown}
      className="relative"
    >
      {/* ── Slide Container ───────────────────────────── */}
      <div className="relative aspect-[4/3] rounded-2xl overflow-hidden bg-stone-100 shadow-xl">
        {GALLERY_IMAGES.map((img, index) => (
          <div
            key={img.src}
            role="group"
            aria-roledescription="slide"
            aria-label={`${slideLabel} ${index + 1} / ${total}`}
            aria-hidden={index !== current}
            className={`
              absolute inset-0
              transition-all duration-700 ease-in-out
              ${
                index === current
                  ? "opacity-100 scale-100"
                  : "opacity-0 scale-105"
              }
            `}
          >
            <Image
              src={img.src}
              alt={t(img.altKey)}
              fill
              className="object-cover"
              sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 45vw"
              loading={index < 3 ? "eager" : "lazy"}
              priority={index === 0}
            />
          </div>
        ))}

        {/* ── Bottom Gradient Overlay ─────────────────── */}
        <div
          className="absolute inset-x-0 bottom-0 h-24 bg-gradient-to-t from-black/50 to-transparent"
          aria-hidden="true"
        />

        {/* ── Navigation Arrows ──────────────────────── */}
        <button
          onClick={goPrev}
          aria-label={t("carousel.prev")}
          className="
            absolute left-3 top-1/2 -translate-y-1/2 z-10
            w-10 h-10 rounded-full
            bg-white/80 backdrop-blur-sm shadow-lg
            flex items-center justify-center
            opacity-0 group-hover:opacity-100
            hover:bg-white
            transition-all duration-300
            focus-visible:opacity-100
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-white focus-visible:ring-offset-2
            focus-visible:ring-offset-stone-900
          "
        >
          <FaChevronLeft className="w-3.5 h-3.5 text-stone-700" aria-hidden="true" />
        </button>

        <button
          onClick={goNext}
          aria-label={t("carousel.next")}
          className="
            absolute right-3 top-1/2 -translate-y-1/2 z-10
            w-10 h-10 rounded-full
            bg-white/80 backdrop-blur-sm shadow-lg
            flex items-center justify-center
            opacity-0 group-hover:opacity-100
            hover:bg-white
            transition-all duration-300
            focus-visible:opacity-100
            focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-white focus-visible:ring-offset-2
            focus-visible:ring-offset-stone-900
          "
        >
          <FaChevronRight className="w-3.5 h-3.5 text-stone-700" aria-hidden="true" />
        </button>

        {/* ── Bottom Controls Bar ────────────────────── */}
        <div className="absolute bottom-0 inset-x-0 z-10 flex items-center justify-between px-4 pb-3">
          {/* Slide Counter */}
          <span className="text-white/80 text-xs font-mono font-medium tabular-nums">
            {String(current + 1).padStart(2, "0")} / {String(total).padStart(2, "0")}
          </span>

          {/* Progress Dots */}
          <div className="flex items-center gap-1" role="tablist" aria-label={t("carousel.dots_label")}>
            {GALLERY_IMAGES.map((_, index) => (
              <button
                key={index}
                role="tab"
                aria-selected={index === current}
                aria-label={`${slideLabel} ${index + 1}`}
                onClick={() => goTo(index)}
                className={`
                  rounded-full transition-all duration-300
                  focus-visible:outline-none focus-visible:ring-2
                  focus-visible:ring-white
                  ${
                    index === current
                      ? "w-6 h-1.5 bg-white"
                      : "w-1.5 h-1.5 bg-white/40 hover:bg-white/70"
                  }
                `}
              />
            ))}
          </div>

          {/* Pause/Play */}
          <button
            onClick={() => setIsPaused((p) => !p)}
            aria-label={isPaused ? playLabel : pauseLabel}
            className="
              w-7 h-7 rounded-full bg-white/20 backdrop-blur-sm
              flex items-center justify-center
              hover:bg-white/30 transition-colors
              focus-visible:outline-none focus-visible:ring-2
              focus-visible:ring-white
            "
          >
            {isPaused ? (
              <FaPlay className="w-2.5 h-2.5 text-white ml-0.5" aria-hidden="true" />
            ) : (
              <FaPause className="w-2.5 h-2.5 text-white" aria-hidden="true" />
            )}
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Main Hero Section ──────────────────────────────────────
export default function HeroSection() {
  const t = useTranslations("Homepage.Hero");

  return (
    <section
      aria-labelledby="hero-heading"
      className="relative bg-gradient-to-b from-stone-50 to-white py-12 lg:py-20 overflow-hidden"
    >
      {/* Decorative blobs */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none" aria-hidden="true">
        <div className="absolute -top-32 -right-32 w-96 h-96 bg-amber-50 rounded-full blur-3xl opacity-50" />
        <div className="absolute -bottom-32 -left-32 w-96 h-96 bg-stone-100 rounded-full blur-3xl opacity-50" />
      </div>

      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col lg:flex-row gap-10 lg:gap-14 items-center">
          {/* ── Left Column ────────────────────────────── */}
          <div className="w-full lg:w-1/2 text-center lg:text-left">
            {/* Badge */}
            <div className="inline-flex items-center gap-2.5 bg-stone-900 text-white px-4 py-2 rounded-full text-xs font-bold uppercase tracking-widest mb-8 shadow-lg">
<Image src={"/flags/Flag_of_Burkina_Faso.svg"} alt={"badge"} width={24} height={24} className="object-cover rounded-full" />
              <span>{t("badge")}</span>
            </div>

            {/* Title */}
            <h1
              id="hero-heading"
              className="text-4xl lg:text-5xl xl:text-6xl font-bold font-serif text-stone-900 mb-4 leading-[1.15]"
            >
              {t("title")}
            </h1>

            {/* Subtitle */}
            <p className="text-lg text-stone-600 leading-relaxed mb-5 max-w-xl mx-auto lg:mx-0">
              {t("subtitle")}
            </p>

            {/* Decorative divider */}
            <div className="flex items-center  mb-8 justify-center lg:justify-start" aria-hidden="true">
              <span className="h-px w-12 " />
              <Image src={'/burkina_faso_flag_with_flagpole_256.png'} className="w-12 h-12 object-contain" width={48} height={48} alt={t("bf_flag_alt")} />
              <span className="h-px w-12 " />
            </div>

            {/* ── Time Cards (isolated re-renders) ────── */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 max-w-lg mx-auto lg:mx-0">
              <TimeCard
                flagSrc="/flags/Flag_of_India.svg"
                flagAlt={t("india_flag_alt")}
                city={t("india_city")}
                country={t("india_country")}
                timezone="Asia/Kolkata"
                localTimeLabel={t("local_time")}
              />
              <TimeCard
                flagSrc="/flags/Flag_of_Burkina_Faso.svg"
                flagAlt={t("bf_flag_alt")}
                city={t("bf_city")}
                country={t("bf_country")}
                timezone="Africa/Ouagadougou"
                localTimeLabel={t("local_time")}
              />
            </div>
          </div>

          {/* ── Right Column (Carousel) ───────────────── */}
          <div className="w-full lg:w-1/2 group">
            <ImageCarousel
              galleryLabel={t("carousel.label")}
              slideLabel={t("carousel.slide")}
              pauseLabel={t("carousel.pause")}
              playLabel={t("carousel.play")}
            />

            {/* Caption below carousel */}
            <p className="text-center text-xs text-stone-400 mt-3 uppercase tracking-widest font-medium">
              {t("carousel.caption")}
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}