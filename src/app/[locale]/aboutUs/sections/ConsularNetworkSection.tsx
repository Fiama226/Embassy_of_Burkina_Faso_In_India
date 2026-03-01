import { useTranslations } from "next-intl";
import { ConsulateCard } from "../ui/ConsulateCard";
import type { ConsulateInfo } from "../types/about";

interface ConsularNetworkSectionProps {
  consulates: ConsulateInfo[];
}

export function ConsularNetworkSection({
  consulates,
}: ConsularNetworkSectionProps) {
  const t = useTranslations("AboutPage.network");

  return (
    <div className="space-y-10">
      <header className="max-w-3xl mx-auto text-center space-y-4">
        <h2 className="text-3xl lg:text-4xl font-serif font-bold text-stone-900">
          {t("title")}
        </h2>
        <div
          className="h-1 w-24 bg-red-600 mx-auto rounded-full"
          aria-hidden="true"
        />
        <p className="text-lg text-stone-600 leading-relaxed">
          {t("desc")}
        </p>
      </header>

      <div className="grid lg:grid-cols-2 gap-8">
        {consulates.map((consulate) => (
          <ConsulateCard
            key={consulate.id}
            consulate={consulate}
            addressLabel={t("labels.address")}
            consulLabel={t("labels.consul")}
            phoneLabel={t("labels.phone")}
          />
        ))}
      </div>
    </div>
  );
}