export default function formatDate(dateString) {
  const date = new Date(dateString);

  return new Intl.DateTimeFormat("fr-FR", {
    weekday: "long",   // lundi, mardi, etc.
    day: "numeric",    // 4, 10, etc.
    month: "long"      // octobre, février, etc.
  }).format(date);
}
