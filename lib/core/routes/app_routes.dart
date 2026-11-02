import 'package:go_router/go_router.dart';
import 'package:masrofy_app/core/routes/routes.dart';
import 'package:masrofy_app/features/auth/view/pages/auth_page.dart';
import 'package:masrofy_app/features/depts/view/pages/depts_page.dart';
import 'package:masrofy_app/features/goals/view/pages/goals_page.dart';
import 'package:masrofy_app/features/home/views/pages/homw_page.dart';
import 'package:masrofy_app/features/incom/view/pages/income_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.auth,
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
