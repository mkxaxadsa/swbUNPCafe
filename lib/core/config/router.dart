import 'package:go_router/go_router.dart';

import '../../features/cafe/pages/cafe_add_page.dart';
import '../../features/cafe/pages/cafe_edit_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/inventory/pages/category_page.dart';
import '../../features/inventory/pages/inventory_add_page.dart';
import '../../features/inventory/pages/inventory_edit_page.dart';
import '../../features/inventory/pages/inventory_page.dart';
import '../../features/news/pages/news_add_page.dart';
import '../../features/news/pages/news_edit_page.dart';
import '../../features/news/pages/news_page.dart';
import '../../features/revenue/pages/revenue_add_page.dart';
import '../../features/revenue/pages/revenue_edit_page.dart';
import '../../features/revenue/pages/revenue_page.dart';
import '../../features/settings/pages/privacy_page.dart';
import '../../features/settings/pages/settings_page.dart';
import '../../features/settings/pages/support_page.dart';
import '../../features/settings/pages/terms_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/cafe.dart';
import '../models/inventory.dart';
import '../models/news.dart';
import '../models/revenue.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/cafe-add',
      builder: (context, state) => const CafeAddPage(),
    ),
    GoRoute(
      path: '/cafe-edit',
      builder: (context, state) => CafeEditPage(
        cafe: state.extra as Cafe,
      ),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) => const CategoryPage(),
    ),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => InventoryPage(
        category: state.extra as String,
      ),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => InventoryAddPage(
            category: state.extra as String,
          ),
        ),
        GoRoute(
          path: 'edit',
          builder: (context, state) => InventoryEditPage(
            inventory: state.extra as Inventory,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/revenue',
      builder: (context, state) => const RevenuePage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const RevenueAddPage(),
        ),
        GoRoute(
          path: 'edit',
          builder: (context, state) => RevenueEditPage(
            revenue: state.extra as Revenue,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => const NewsPage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const NewsAddPage(),
        ),
        GoRoute(
          path: 'edit',
          builder: (context, state) => NewsEditPage(
            news: state.extra as News,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
      routes: [
        GoRoute(
          path: 'support',
          builder: (context, state) => const SupportPage(),
        ),
        GoRoute(
          path: 'terms',
          builder: (context, state) => const TermsPage(),
        ),
        GoRoute(
          path: 'privacy',
          builder: (context, state) => const PrivacyPage(),
        ),
      ],
    ),
  ],
);
