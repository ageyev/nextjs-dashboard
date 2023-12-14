/*
* https://nextjs.org/learn/dashboard-app/streaming
* loading.tsx is a special Next.js file built on top of Suspense, it allows you to create fallback UI to show as a replacement
* while page content loads.
* Since <Sidebar> is static, so it's shown immediately. The user can interact with <Sidebar> while the dynamic content is loading.
*
* */

import DashboardSkeleton from '@/app/ui/skeletons';

export default function Loading() {
    // return <div>Loading...</div>;
    return <DashboardSkeleton/>;
}