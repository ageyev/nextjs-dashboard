import '@/app/ui/global.css'
import {inter} from '@/app/ui/fonts';
import React from "react";
// https://nextjs.org/docs/app/building-your-application/routing/pages-and-layouts#root-layout-required
// The root layout is defined at the top level of the app directory and applies to all routes.
// The root layout is a Server Component by default and can not be set to a Client Component.
export default function RootLayout({children,}: { children: React.ReactNode; }) {
    return (
        <html lang="en">
        <body className={`${inter.className} antialiased`}>{children}</body>
        </html>
    );
}
