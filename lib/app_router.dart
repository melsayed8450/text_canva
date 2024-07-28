import 'package:go_router/go_router.dart';
import 'package:text_canva/utils/routes.dart';
import 'package:text_canva/view/home/home_page.dart';

final router = GoRouter(
  /// Initial Routing Location
  initialLocation: AppRoutes.home,

  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
