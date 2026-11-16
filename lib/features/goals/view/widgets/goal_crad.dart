import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/num_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/features/goals/models/goal_modal.dart';

class GoalCard extends StatelessWidget {
  final GoalModal goal;
  final IconData icon;
  final Color color;

  const GoalCard({required this.icon, required this.color, required this.goal});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Container(
      padding: 16.allPadding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.rL),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      // تم دمج النصوص داخل Expanded لحماية الشاشة من خطأ Overflow
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.rM),
            ),
            child: Icon(icon, color: color, size: AppSizes.iconM),
          ),
          AppSizes.m.horizontalSpace,

          // 🔥 حماية الـ UI: استخدام Expanded للنصوص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(goal.title, style: context.textTheme.titleMedium),
                4.verticalSpace,
                Text('$goal.current YER', style: context.textTheme.bodyMedium),
                2.verticalSpace,
                Text(
                  'من $goal.target YER',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),

          AppSizes.s.horizontalSpace,

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$goal.percentage%',
                style: context.textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              8.verticalSpace,
              SizedBox(
                width: 80.w,
                child: ClipRRect(
                  borderRadius: 10.r.radius,
                  child: LinearProgressIndicator(
                    value: goal.progress,
                    minHeight: 6.h,
                    backgroundColor: isDark
                        ? AppColors.borderDark
                        : AppColors.grey100,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
