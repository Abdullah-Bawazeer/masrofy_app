import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/core/widgets/custom_app_bar.dart';
import 'package:masrofy_app/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy_app/features/incom/view/widgets/income_source_card.dart';
import 'package:masrofy_app/features/incom/view/widgets/income_summery_card.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> incomeSources = [
      {
        'title': 'الراتب الشهري',
        'subtitle': 'الشركة الحالية',
        'amount': '20.000',
        'frequency': 'كل شهر',
        'icon': Icons.business_center_rounded,
        'color': AppColors.primary,
      },
      {
        'title': 'عمل حر ',
        'subtitle': 'مشاريع مستقلة',
        'amount': '20.000',
        'frequency': 'كل شهر',
        'icon': Icons.laptop_mac_rounded,
        'color': AppColors.primary,
      },
      {
        'title': 'الاستثمار',
        'subtitle': 'ارباح الاستثمار',
        'amount': '20.000',
        'frequency': 'كل 3 اشهر',
        'icon': Icons.trending_up_rounded,
        'color': AppColors.accent,
      },
      {
        'title': 'اخرئ',
        'subtitle': 'دخل اضافي',
        'amount': '20.000',
        'frequency': 'عند الحاجه',
        'icon': Icons.more_horiz_rounded,
        'color': AppColors.purple,
      },
    ];
    return AppScaffold(
      isDark: context.isDarkMode,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(title: 'مصادر الدخل'),
            AppSizes.m.verticalSpace,
            const IncomeSummeryCard(),
            AppSizes.m.verticalSpace,

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: incomeSources.length,
              separatorBuilder: (context, index) => AppSizes.m.verticalSpace,
              itemBuilder: (context, index) {
                final item = incomeSources[index];
                return IncomeSourceCard(
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String,
                  amount: item['amount'] as String,
                  frequency: item['frequency'] as String,
                  icon: item['icon'] as IconData,
                  color: item['color'] as Color,
                );
              },
            ),
          ],
        ).paddingAll(AppSizes.screenPadding),
      ),
    );
  }
}
