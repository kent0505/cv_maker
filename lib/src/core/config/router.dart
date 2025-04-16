import 'package:go_router/go_router.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/onboard/screens/onboard_screen.dart';
import '../../features/onboard/screens/splash_screen.dart';
import '../../features/resume/screens/create_resume_screen.dart';
import '../../features/resume/screens/edit_resume_screen.dart';
import '../../features/resume/screens/resume_preview_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/settings/screens/privacy_screen.dart';
import '../../features/settings/screens/terms_screen.dart';
import '../../features/settings/screens/languages_screen.dart';
import '../models/resume.dart';
import '../models/template.dart';

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

    // RESUME
    GoRoute(
      path: CreateResumeScreen.routePath,
      builder: (context, state) => CreateResumeScreen(
        template: state.extra as Template,
      ),
    ),
    GoRoute(
      path: EditResumeScreen.routePath,
      builder: (context, state) => EditResumeScreen(
        resume: state.extra as Resume,
      ),
    ),
    GoRoute(
      path: ResumePreviewScreen.routePath,
      builder: (context, state) => ResumePreviewScreen(
        resume: state.extra as Resume,
      ),
    ),
  ],
);
