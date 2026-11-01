import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy_app/features/auth/view/widets/app_logo.dart';
import 'package:masrofy_app/features/auth/view/widets/auth_btn.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return AppScaffold(
      isDark: isDark,
      child: Column(
        children: [
          const Spacer(flex: 2),
          AppLogo(),
          AppSizes.m.verticalSpace,
          Text(
            "مصروفي",
            style: context.textTheme.displayLarge!.copyWith(
              color: isDark ? AppColors.white : AppColors.primary,
            ),
          ),
          AppSizes.l.verticalSpace,
          Text(
            "مرحبا بك مجددا في مصروفي",
            style: context.textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.white : AppColors.primary,
            ),
          ),
          AppSizes.l.verticalSpace,
          Text(
            "أدر مصروفاتك وديونك وأهدافك المالية في مكان واحد",
            style: context.textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.grey100 : AppColors.primary,
            ),
          ),
          AppSizes.l.verticalSpace,
          AuthBtn().paddingHorizontal(AppSizes.s),
          //AuthBtn().paddingHorizontal(AppSizes.s),
          Spacer(),
        ],
      ),
    );
  }
}
