import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/num_extension.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/core/widgets/custom_app_bar.dart';
import 'package:masrofy_app/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy_app/features/goals/view/widgets/goal_crad.dart';
import 'package:masrofy_app/features/goals/view/widgets/goals_summery_card.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  int _selectedTabIndex = 0;

  // تم تعديل الأرقام الصحيحة مثل 1 لتصبح 1.0 كأفضل ممارسة للبيانات الثابتة
  final List _allGoals = [
    {
      'title': 'شراء سيارة',
      'current': '250,000',
      'target': '250,000',
      'percentage': 100,
      'progress': 1.0,
      'icon': Icons.directions_car_rounded,
      'color': AppColors.blue,
      'isActive': false,
    },
    {
      'title': 'سفر تركيا',
      'current': '12,500',
      'target': '25,000',
      'percentage': 50,
      'progress': 0.5,
      'icon': Icons.airplanemode_active_rounded,
      'color': AppColors.success,
      'isActive': true,
    },
    {
      'title': 'صندوق الطوارئ',
      'current': '8,000',
      'target': '10,000',
      'percentage': 80,
      'progress': 0.8,
      'icon': Icons.shield_rounded,
      'color': AppColors.success,
      'isActive': true,
    },
    {
      'title': 'شراء منزل',
      'current': '0',
      'target': '500,000',
      'percentage': 0,
      'progress': 0.0,
      'icon': Icons.home_rounded,
      'color': AppColors.expense,
      'isActive': true,
    },
    {
      'title': 'هاتف جديد',
      'current': '15,000',
      'target': '15,000',
      'percentage': 100,
      'progress': 1.0,
      'icon': Icons.phone_android_rounded,
      'color': AppColors.success,
      'isActive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final iconColor = context.colorScheme.onSurface;

    final filteredGoals = _allGoals.where((goal) {
      if (_selectedTabIndex == 1) {
        return !goal['isActive'];
      }
      return goal['isActive'];
    }).toList();

    return AppScaffold(
      isDark: context.isDarkMode,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(title: 'الأهداف المالية'),
            AppSizes.m.verticalSpace,

            GoalsSummaryCard(),
            AppSizes.l.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabItem('نشطة', index: 0),
                AppSizes.l.horizontalSpace,
                _buildTabItem('مكتملة', index: 1),
              ],
            ),
            AppSizes.l.verticalSpace,

            if (filteredGoals.isEmpty)
              Center(
                child: Column(
                  children: [
                    AppSizes.xxl.verticalSpace,
                    Icon(
                      Icons.track_changes_outlined,
                      size: AppSizes.iconXL,
                      color: AppColors.grey400,
                    ),
                    AppSizes.m.verticalSpace,
                    Text(
                      'لا توجد أهداف هنا',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredGoals.length,
                separatorBuilder: (context, index) => AppSizes.m.verticalSpace,
                itemBuilder: (context, index) {
                  final goal = filteredGoals[index];
                  return GoalCard(
                    title: goal['title'] as String,
                    current: goal['current'] as String,
                    target: goal['target'] as String,
                    percentage: goal['percentage'] as int,
                    // 🔥 الحل الجذري لمشكلة الـ Casting هنا
                    progressValue: (goal['progress'] as num).toDouble(),
                    icon: goal['icon'] as IconData,
                    color: goal['color'] as Color,
                  );
                },
              ),
          ],
        ).paddingAll(AppSizes.screenPadding ?? 16.0),
      ),
    );
  }

  Widget _buildTabItem(String label, {required int index}) {
    final isSelected = _selectedTabIndex == index;
    final isDark = context.isDarkMode;
    final activeColor = AppColors.purple;

    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? activeColor
                  : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          AppSizes.xs.verticalSpace,
          Container(
            width: 70.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: isSelected ? activeColor : Colors.transparent,
              borderRadius: 1.r.radius,
            ),
          ),
        ],
      ),
    );
  }
}
