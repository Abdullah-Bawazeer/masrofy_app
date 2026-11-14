import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy_app/core/routes/routes.dart';
import 'package:masrofy_app/features/auth/repository/auth_repository.dart';
import 'package:masrofy_app/features/auth/view/pages/auth_page.dart';
import 'package:masrofy_app/features/depts/view/pages/depts_page.dart';
import 'package:masrofy_app/features/goals/view/pages/goals_page.dart';
import 'package:masrofy_app/features/home/views/pages/homw_page.dart';
import 'package:masrofy_app/features/incom/view/pages/income_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authProvider = ref.watch(authRepoProvider);
  return GoRouter(
    initialLocation: AppRoutes.auth,
    redirect: (context, state) {
      bool isLoggedIn = authProvider.currentUser != null;
      final isAuthRoute = state.matchedLocation == AppRoutes.auth;
      if (!isLoggedIn) {
        return isAuthRoute ? null : AppRoutes.auth;
      }
      if (isAuthRoute) {
        return AppRoutes.home;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.goals,
        builder: (context, state) => const GoalsPage(),
      ),
      GoRoute(
        path: AppRoutes.depts,
        builder: (context, state) => const DeptsPage(),
      ),
      GoRoute(
        path: AppRoutes.income,
        builder: (context, state) => const IncomePage(),
      ),
    ],
  );
});
