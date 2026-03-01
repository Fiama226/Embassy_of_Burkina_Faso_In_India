import { useTranslations } from 'next-intl';
import Messagedelambassadeur from './HomePageComponent/Messagedelambassadeur';
import FirstComponent from './HomePageComponent/firstComponent'
import Soutient_patriotique from './HomePageComponent/Soutient_patriotique';
import ContactUs from './HomePageComponent/contactUs';
import DividerOfComponents from './HomePageComponent/DividerOfComponents';
export default function HomePage() {
    const t = useTranslations('HomePage');
    return (
        <div className="flex flex-col items-center justify-center min-h-screen py-2">
            <main className="flex flex-col items-center justify-center w-full flex-1 px-20 text-center">
                <FirstComponent />
                <DividerOfComponents />
                <Messagedelambassadeur />
                <DividerOfComponents />
                <Soutient_patriotique />
                <DividerOfComponents />
                <ContactUs />
            </main>
        </div>
    );
}
