/** @type {import('next-sitemap').IConfig} */
module.exports = {
  siteUrl: 'https://ambassadeburkinafasoindia.com',
  generateRobotsTxt: true,
  sitemapSize: 5000,
  changefreq: 'weekly',
  priority: 0.7,
  exclude: ['/admin/**', '/api/**'],
  robotsTxtOptions: {
    policies: [
      {
        userAgent: '*',
        allow: '/',
        disallow: ['/admin/', '/api/'],
      },
    ],
  },
  transform: async (config, path) => {
    // Custom transform for localized paths
    const isLocalized = path.startsWith('/en/') || path.startsWith('/fr/');

    return {
      loc: path,
      changefreq: config.changefreq,
      priority: isLocalized ? 0.8 : config.priority,
      lastmod: config.autoLastmod ? new Date().toISOString() : undefined,
    };
  },
};