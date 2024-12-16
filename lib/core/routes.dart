import 'package:flutter_vroom/data/exports.dart';
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
    GoRoute(
      name: CarListingScreen.routeName,
      path: CarListingScreen.routePath,
      builder: (context, state) => CarListingScreen(),
    ),
    GoRoute(
      name: CarDetailsScreen.routeName,
      path: CarDetailsScreen.routePath,
      builder: (context, state) {
        final carMap = state.extra as Map<String, dynamic>;
        final Car car = Car.fromMap(carMap);
        return CarDetailsScreen(
          car: car,
        );
      },
    ),
    GoRoute(
      name: MapDetailsScreen.routeName,
      path: MapDetailsScreen.routePath,
      builder: (context, state) {
        final carMap = state.extra as Map<String, dynamic>;
        final Car car = Car.fromMap(carMap);
        return MapDetailsScreen(
          car: car,
        );
      },
    ),
  ],
);
