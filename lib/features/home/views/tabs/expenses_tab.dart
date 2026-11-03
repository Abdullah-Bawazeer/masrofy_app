import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/constants/app_assets.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/num_extension.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';

class ExpensesTab extends StatelessWidget {
  const ExpensesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final List<Map<String, dynamic>> groups = [
      {
        'date': 'اليوم',
        'items': [
          {
            'title': 'مطعم',
            'subtitle': 'غداء مع الاصدقاء',
            'time': '12:30',
            'amount': '180',
            'icon': Icons.restaurant_rounded,
            'iconColor': AppColors.expense,
            'isHighlighted': true,
          },
          {
            'title': 'مواصلات',
            'subtitle': 'مترو',
            'time': '8:30',
            'amount': '20',
            'icon': Icons.directions_car_rounded,
            'iconColor': AppColors.blue,
            'isHighlighted': true,
          },
          {
            'title': 'قهوة',
            'subtitle': 'ستاربوكس',
            'time': '7:45',
            'amount': '45',
            'icon': Icons.local_cafe_rounded,
            'iconColor': AppColors.orange,
            'isHighlighted': false,
          },
          {
            'title': 'تسوق',
            'subtitle': 'من سوبر ماركت',
            'time': '6:30',
            'amount': '215',
            'icon': Icons.shopping_bag_rounded,
            'iconColor': AppColors.success,
            'isHighlighted': false,
          },
        ],
      },
      {
        'date': 'امس',
        'items': [
          {
            'title': 'فواتير',
            'subtitle': 'فاتورة كهرباء',
            'time': '4:30 م',
            'amount': '350',
            'icon': Icons.electric_bolt_rounded,
            'iconColor': AppColors.purple,
            'isHighlighted': true,
          },
          {
            'title': 'تسوق',
            'subtitle': 'ملابس',
            'time': '2:10 م',
            'amount': '320',
            'icon': Icons.shopping_bag_rounded,
            'iconColor': AppColors.success,
            'isHighlighted': false,
          },
        ],
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('المعاملات', style: context.textTheme.titleLarge).center(),
          AppSizes.m.verticalSpace,
          //summery card
          const ExpensesSummeryCard(),
          AppSizes.m.horizontalSpace,

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: groups.length,
            itemBuilder: (context, groupIndex) {
              final group = groups[groupIndex];
              final date = group['date'] as String;
              final items = group['items'] as List<Map<String, dynamic>>;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    date,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ).paddingAll(AppSizes.s),

                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : AppColors.white,
                      borderRadius: AppSizes.rL.radius,
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                    ),

                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        thickness: 0.5,
                        color: isDark
                            ? AppColors.dividerDark
                            : AppColors.dividerLight,
                      ),
                      itemBuilder: (context, itemIndex) {
                        final item = items[itemIndex];
                        return TransactionItem(
                          title: item['title'] as String,
                          subtitle: item['subtitle'] as String,
                          time: item['time'] as String,
                          amount: item['amount'] as String,
                          icon: item['icon'] as IconData,
                          iconColor: item['iconColor'] as Color,
                          isHighlighted: item['isHighlighted'] as bool,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ).paddingAll(AppSizes.screenPadding),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String amount;
  final IconData icon;
  final Color iconColor;
  final bool isHighlighted;
  const TransactionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.m, vertical: 12.h),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: AppSizes.iconS),
              ),
              AppSizes.m.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            time,
            style: context.textTheme.bodySmall?.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          const Spacer(),
          Text(
            '$amount EGP',
            style: context.textTheme.bodyLarge?.copyWith(
              color: isHighlighted
                  ? AppColors.expense
                  : (isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textSecondaryLight),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ExpensesSummeryCard extends StatelessWidget {
  const ExpensesSummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSizes.m.allPadding,
      decoration: BoxDecoration(
        gradient: AppColors.walletGradient,
        borderRadius: AppSizes.rXL.radius,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'اجمالي المصروفات',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSizes.xs.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '3,850',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  AppSizes.s.horizontalSpace,
                  Text(
                    'EGP',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              AppSizes.m.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: AppSizes.rM.radius,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                    AppSizes.xs.horizontalSpace,
                    Text(
                      'هذا الشهر',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).expanded(),
          AppSizes.s.horizontalSpace,
          Image.asset(
            AppAssets.goals,
            width: 120.w,
            height: 120.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
