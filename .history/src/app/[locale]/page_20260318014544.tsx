import { useTranslations } from 'next-intl';
import Messagedelambassadeur from './HomePageComponent/Messagedelambassadeur';
import Soutient_patriotique from './HomePageComponent/Soutient_patriotique';
import ContactUs from './HomePageComponent/contactUs';
import DividerOfComponents from './HomePageComponent/DividerOfComponents';
import HomePageClient from './HomePageClient';

export default function HomePage() {
    return (
        <div className="flex flex-col items-center justify-center min-h-screen py-2">
            <main className="flex flex-col items-center justify-center w-full flex-1 px-2 sm:px-4 md:px-6 lg:px-20 text-center">
                <HomePageClient />
                <Messagedelambassadeur />
                <DividerOfComponents />
                <Soutient_patriotique />
                <DividerOfComponents />
                <ContactUs />
            </main>
        </div>
    );
}
