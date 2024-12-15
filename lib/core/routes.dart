import 'package:flutter_vroom/presentation/exports.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: OnboardingScreen.routePath,
  routes: [
    GoRoute(
      name: OnboardingScreen.routeName,
      path: OnboardingScreen.routePath,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routePath,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
