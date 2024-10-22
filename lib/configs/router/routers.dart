import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/auth/login.dart';

import '../../features/app/app.dart';

final router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
    GoRoute(
      path: OnboardScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const OnboardScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
    GoRoute(
      path: LoginPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
  ],
);