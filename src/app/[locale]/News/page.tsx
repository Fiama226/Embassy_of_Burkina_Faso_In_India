"use client";
import React, { useState, useEffect } from "react";
import { Link } from '@/i18n/routing';
import { Tabs, MantineProvider, Pagination, Loader } from "@mantine/core";
import { useTranslations } from "next-intl";
import "@mantine/core/styles.css";
import { useLocale } from 'next-intl';

interface Props {
  params: { locale: 'en' | 'fr'; slug: string }
}

function NewsSection() {
  const t = useTranslations("News");

  const [embassyNews, setEmbassyNews] = useState([]);
  const [loading, setLoading] = useState(true);
  
  // Pagination State
  const [activePage, setActivePage] = useState(1);
  const itemsPerPage = 5;

  const locale = useLocale();

  useEffect(() => {
    const fetchNews = async () => {
      try {
        const res = await fetch(`/api/news?locale=${locale}`);
        const data = await res.json();
        console.log("I am just here for testing purposes",data)
        setEmbassyNews(data.docs);
      } catch (error) {
        console.error("Error fetching news:", error);
      } finally {
        setLoading(false);
      }
    };
    fetchNews();
  }, [locale]);

  
  // Calculate slice for pagination
  const totalPages = Math.ceil(embassyNews.length / itemsPerPage);
  const displayedNews = embassyNews.slice(
    (activePage - 1) * itemsPerPage,
    activePage * itemsPerPage
  );

  const governmentFeeds = [
    {
      id: 1,
      src: "https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FPrimature.Faso%2Fposts%2Fpfbid02h9LYKUjJcLc5cy2gLtnv8eoSCrNZjKXUPkVRZdhJ3evhzUggqb9j3LmX7gB8owWMl&show_text=true&width=500",
      height: 799,
    },
    // ... rest of feeds
  ];

  return (
    <section className="w-full bg-white py-8 lg:py-10 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-8 lg:mb-16">
          <h2 className="text-3xl lg:text-5xl xl:text-6xl font-bold text-gray-900 mb-4">
            {t("title")}
          </h2>
          <div className="w-24 h-1 bg-amber-600 mx-auto"></div>
        </div>

        <MantineProvider>
          <Tabs
            defaultValue="Ambassy"
            color="orange"
            variant="pills"
            radius="xl"
            classNames={{
              root: "w-full",
              list: "flex justify-center mb-8 lg:mb-12",
              tab: "data-[active]:bg-amber-600 data-[active]:text-white hover:bg-amber-100 transition-all duration-300",
            }}
          >
            <Tabs.List justify="center" className="flex-wrap gap-2 lg:gap-4">
              <Tabs.Tab value="Ambassy" className="px-4 lg:px-8 py-3 lg:py-4 text-sm lg:text-lg font-semibold">
                {t("tabs.embassy")}
              </Tabs.Tab>
              <Tabs.Tab value="governement" className="px-4 lg:px-8 py-3 lg:py-4 text-sm lg:text-lg font-semibold">
                {t("tabs.government")}
              </Tabs.Tab>
            </Tabs.List>

            <Tabs.Panel value="Ambassy">
              {loading ? (
                <div className="flex justify-center py-10">
                  <Loader color="orange" size="xl" />
                </div>
              ) : (
                <>
                  <div className="grid gap-6 lg:gap-8 max-w-4xl mx-auto">
                    {displayedNews.length > 0 ? (
                      displayedNews.map((item) => {
                        // Handle Strapi's flat or nested attributes structure
                        const data = item;
                        return (
                          <article key={item.id} className="group">
                            <Link
                              href={`/News/${item.slug}`}
                              className="block bg-gradient-to-r from-amber-50 to-white hover:from-amber-100 hover:to-amber-50 rounded-2xl p-6 lg:p-8 shadow-md hover:shadow-xl transition-all duration-300 border border-amber-200 group-hover:border-amber-400"
                            >
                              <div className="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-4">
                                <div className="flex-1">
                                  <div className="flex items-center gap-3 mb-3">
                                    <time className="text-xs lg:text-sm text-gray-600 font-medium">
                                      {new Date(data.publishDate).toLocaleDateString()}
                                    </time>
                                  </div>
                                  <h3 className="text-lg lg:text-xl font-semibold text-gray-900 group-hover:text-amber-700 transition-colors">
                                    {data.title}
                                  </h3>
                                </div>
                                <div className="flex-shrink-0">
                                  <svg className="w-6 h-6 text-amber-600 group-hover:translate-x-2 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M14 5l7 7m0 0l-7 7m7-7H3" />
                                  </svg>
                                </div>
                              </div>
                            </Link>
                          </article>
                        );
                      })
                    ) : (
                      <p className="text-center text-gray-500">No news found.</p>
                    )}
                  </div>

                  {/* Mantine Pagination */}
                  {totalPages > 1 && (
                    <div className="flex justify-center mt-12">
                      <Pagination
                        total={totalPages}
                        value={activePage}
                        onChange={setActivePage}
                        color="orange"
                        size="lg"
                        radius="xl"
                        withEdges
                      />
                    </div>
                  )}
                </>
              )}
            </Tabs.Panel>

            <Tabs.Panel value="governement">
               {/* Government feeds content here (same as your original) */}
            </Tabs.Panel>
          </Tabs>
        </MantineProvider>
      </div>
    </section>
  );
}

export default NewsSection;