"use client";

import { useTranslations } from 'next-intl';
import FirstComponent from './HomePageComponent/firstComponent'
import DividerOfComponents from './HomePageComponent/DividerOfComponents';

export default function HomePageClient() {
    const t = useTranslations('HomePage');
    
    return (
        <>
            <FirstComponent />
            <DividerOfComponents />
        </>
    );
}
