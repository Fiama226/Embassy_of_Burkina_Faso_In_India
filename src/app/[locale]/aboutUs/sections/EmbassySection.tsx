import { useTranslations } from "next-intl";
import {
  FaMapMarkerAlt,
  FaPhone,
  FaFax,
  FaEnvelope,
} from "react-icons/fa";
import { ContactItem } from "../ui/ContactItem";
import { EMBASSY_CONTACT } from "../data/contactInfo";

export function EmbassySection() {
  const t = useTranslations("AboutPage.embassy");

  return (
    <div className="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden">
      <div className="p-8 lg:p-12">
        <h2 className="text-3xl lg:text-4xl font-serif font-bold text-stone-900 mb-8 pb-4 border-b border-stone-100">
          {t("title")}
        </h2>

        <div className="flex flex-col xl:flex-row gap-12">
          {/* Text + Contact */}
          <div className="w-full xl:w-1/2 space-y-8">
            <div className="space-y-4">
              <p className="text-stone-700 leading-relaxed text-base lg:text-lg">
                {t("desc1")}
              </p>
              <p className="text-stone-700 leading-relaxed text-base lg:text-lg">
                {t("desc2")}
              </p>
            </div>


          </div>

          {/* Map */}
          <div className="w-full xl:w-1/2">
            <div className="h-[400px] w-full rounded-2xl overflow-hidden shadow-lg border border-stone-200">
              <iframe
                className="w-full h-full"
                src={EMBASSY_CONTACT.mapEmbedUrl}
                title={t("map_title")}
                allowFullScreen
                loading="lazy"
                referrerPolicy="no-referrer-when-downgrade"
              />
            </div>
            <p className="text-xs text-stone-400 mt-2 text-center">
              {t("map_caption")}
            </p>
          </div>
        </div>
                    {/* Contact Card */}
            <div className="bg-stone-50 rounded-xl p-6 border border-stone-200">
              <h3 className="font-serif font-bold text-xl text-stone-900 mb-5 flex items-center gap-3">
                <span
                  className="w-1 h-6 bg-red-600 rounded-full"
                  aria-hidden="true"
                />
                {t("contact_label")}
              </h3>

              <div className="space-y-4 grid grid-cols-2 gap-4 mt-10 ">
                <ContactItem
                  icon={FaMapMarkerAlt}
                  label={t("labels.address")}
                  value={EMBASSY_CONTACT.address}
                />
                <ContactItem
                  icon={FaPhone}
                  label={t("labels.phone")}
                  value={EMBASSY_CONTACT.phone}
                  href={`tel:${EMBASSY_CONTACT.phone.split("/")[0]}`}
                />
                <ContactItem
                  icon={FaFax}
                  label={t("labels.fax")}
                  value={EMBASSY_CONTACT.fax}
                />
                <ContactItem
                  icon={FaEnvelope}
                  label={t("labels.email")}
                  value={EMBASSY_CONTACT.email}
                  href={`mailto:${EMBASSY_CONTACT.email}`}
                />
              </div>
            </div>
      </div>
    </div>
  );
}
