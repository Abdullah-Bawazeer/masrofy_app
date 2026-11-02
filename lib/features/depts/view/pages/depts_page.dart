import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/widget_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';
import 'package:masrofy_app/core/widgets/custom_app_scaffold.dart';

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
            //headre row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: iconColor,
                    size: AppSizes.iconM,
                  ),
                ),
                Text(
                  "الديون",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle add button press
                  },
                  icon: Icon(
                    Icons.add_rounded,
                    color: iconColor,
                    size: AppSizes.iconM,
                  ),
                ),
              ],
            ),
            AppSizes.m.verticalSpace,
          ],
        ).paddingAll(AppSizes.screenPadding),
      ),
    );
  }
}
