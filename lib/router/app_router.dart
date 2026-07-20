import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/section_pages.dart';
import '../widgets/app_shell.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/about',
          name: 'about',
          builder: (context, state) => const AboutPage(),
        ),
        GoRoute(
          path: '/ebooks',
          name: 'ebooks',
          builder: (context, state) => const EbooksPage(),
        ),
        GoRoute(
          path: '/published',
          name: 'published',
          builder: (context, state) => const PublishedPage(),
        ),
        GoRoute(
          path: '/upcoming',
          name: 'upcoming',
          builder: (context, state) => const UpcomingPage(),
        ),
        GoRoute(
          path: '/categories',
          name: 'categories',
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          path: '/recommended',
          name: 'recommended',
          builder: (context, state) => const RecommendedPage(),
        ),
        GoRoute(
          path: '/guide',
          name: 'guide',
          builder: (context, state) => const GuidePage(),
        ),
        GoRoute(
          path: '/news',
          name: 'news',
          builder: (context, state) => const NewsPage(),
        ),
        GoRoute(
          path: '/faq',
          name: 'faq',
          builder: (context, state) => const FaqPage(),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);
