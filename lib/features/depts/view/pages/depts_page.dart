import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/num_extension.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/core/widgets/custom_app_bar.dart';
import 'package:masrofy_app/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy_app/features/depts/view/widgets/debt_summery_card.dart';
import 'package:masrofy_app/features/depts/view/widgets/dept_card.dart';

class DeptsPage extends StatefulWidget {
  const DeptsPage({super.key});

  @override
  State<DeptsPage> createState() => _DeptsPageState();
}

class _DeptsPageState extends State<DeptsPage> {
  int _selectedTapIndex = 0;

  final List<Map<String, dynamic>> _allDebts = [
    {
      'title': 'قرض شخصي',
      'subtitle': 'الأهلي',
      'remaining': '3,000',
      'total': '6,000',
      'percentage': 60,
      'progress': 0.6,
      'color': AppColors.expense,
      'isPaid': false,
    },
    {
      'title': 'بطاقة الائتمان',
      'subtitle': 'البنك التجاري الدولي',
      'remaining': '1,250',
      'total': '2,000',
      'percentage': 37,
      'progress': 0.37,
      'color': AppColors.blue,
      'isPaid': false,
    },
    {
      'title': 'دين لصديق',
      'subtitle': 'أحمد محمد',
      'remaining': '950',
      'total': '1,000',
      'percentage': 95,
      'progress': 0.95,
      'color': AppColors.success,
      'isPaid': false,
    },
    // Mock paid debt for demonstrating tab filtering
    {
      'title': 'دين لـ محمد',
      'subtitle': 'مسترد كامل',
      'remaining': '0',
      'total': '2,000',
      'percentage': 100,
      'progress': 1.0,
      'color': AppColors.success,
      'isPaid': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final iconColor = context.colorScheme.onSurface;
    final filteredDepts = _allDebts.where((debt) {
      if (_selectedTapIndex == 1) {
        return !debt['isPaid'] &&
            double.parse((debt['remaining'] as String).replaceAll(',', '')) > 0;
      } else if (_selectedTapIndex == 2) {
        return debt['isPaid'] ||
            double.parse((debt['remaining'] as String).replaceAll(',', '')) ==
                0;
      }
      return !debt['isPaid'];
    }).toList();

    return AppScaffold(
      isDark: context.isDarkMode,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(title: 'الديون'),
            AppSizes.m.verticalSpace,
            const DebtsSummeryCard(),
            AppSizes.m.verticalSpace,

            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem('كل الديون', 0),
                _buildTabItem('متبقي', 1),
                _buildTabItem('مسددة', 2),
              ],
            ),
            AppSizes.m.verticalSpace,
            if (filteredDepts.isEmpty)
              Center(
                child: Column(
                  children: [
                    AppSizes.xxl.verticalSpace,
                    Icon(
                      Icons.account_balance_wallet_rounded,
                      size: AppSizes.iconXXL,
                      color: AppColors.grey500,
                    ),
                    AppSizes.m.verticalSpace,
                    Text(
                      '  لا توجد ديون حالية',
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
                itemCount: filteredDepts.length,
                separatorBuilder: (context, index) => AppSizes.m.verticalSpace,
                itemBuilder: (context, index) {
                  final debt = filteredDepts[index];
                  return DebtCard(
                    title: debt['title'] as String,
                    subtitle: debt['subtitle'] as String,
                    remaining: debt['remaining'] as String,
                    total: debt['total'] as String,
                    percentage: debt['percentage'] as int,
                    progress: debt['progress'] as double,
                    color: debt['color'] as Color,
                  );
                },
              ),
          ],
        ).paddingAll(AppSizes.screenPadding),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    final isSelected = _selectedTapIndex == index;
    final isDark = context.isDarkMode;
    return GestureDetector(
      onTap: () => setState(() => _selectedTapIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? AppColors.expense
                  : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
            ),
          ),

          AppSizes.s.verticalSpace,
          Container(
            width: 60.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.expense : Colors.transparent,
              borderRadius: 1.r.radius,
            ),
          ),
        ],
      ),
    );
  }
}


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         context.pop();
            //       },
            //       icon: Icon(
            //         Icons.arrow_back_rounded,
            //         color: iconColor,
            //         size: AppSizes.iconM,
            //       ),
            //     ),
            //     Text(
            //       "الديون",
            //       style: context.textTheme.titleLarge?.copyWith(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         // Handle add button press
            //       },
            //       icon: Icon(
            //         Icons.add_rounded,
            //         color: iconColor,
            //         size: AppSizes.iconM,
            //       ),
            //     ),
            //   ],
            // ),