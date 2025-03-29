import 'package:go_router/go_router.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/onboard/screens/onboard_screen.dart';
import '../../features/onboard/screens/splash_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/settings/screens/privacy_screen.dart';
import '../../features/settings/screens/terms_screen.dart';
import '../../features/settings/screens/languages_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: OnboardScreen.routePath,
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: HomeScreen.routePath,
      builder: (context, state) => const HomeScreen(),
    ),

    // SETTINGS
    GoRoute(
      path: SettingsScreen.routePath,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: LanguagesScreen.routePath,
      builder: (context, state) => const LanguagesScreen(),
    ),
    GoRoute(
      path: TermsScreen.routePath,
      builder: (context, state) => const TermsScreen(),
    ),
    GoRoute(
      path: PrivacyScreen.routePath,
      builder: (context, state) => const PrivacyScreen(),
    ),
  ],
);
