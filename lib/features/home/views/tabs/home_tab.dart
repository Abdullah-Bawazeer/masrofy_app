import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy_app/features/home/views/widgets/home_app_bar.dart';
import 'package:masrofy_app/features/home/views/widgets/overview_section.dart';
import 'package:masrofy_app/features/home/views/widgets/quick_tools.dart';
import 'package:masrofy_app/features/home/views/widgets/summery_card.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isDark: context.isDarkMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar().paddingAll(AppSizes.s),
            AppSizes.l.verticalSpace,
            SummeryCard().paddingAll(AppSizes.m),
            AppSizes.l.verticalSpace,
            QuickTools(),
            AppSizes.l.verticalSpace,
            OverviewSection(),
          ],
        ),
      ),
    );
  }
}
