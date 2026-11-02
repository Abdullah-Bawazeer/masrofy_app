import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/extensions/num_extension.dart';
import 'package:masrofy_app/core/themes/app_colors.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';

class _DebtsSummeryCard extends StatelessWidget {
  const _DebtsSummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 16.allPadding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF87171), Color(0xFFFEF4444)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppSizes.rXL.radius,
        boxShadow: [
          BoxShadow(
            color: AppColors.expense.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اجمالي الديون',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSizes.xs.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '5,200',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: AppColors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSizes.xs.horizontalSpace,
                  Text(
                    'EGP',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              AppSizes.s.verticalSpace,
              Text(
                'متيقي',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 54.w,
                    height: 54.w,
                    child: CircularProgressIndicator(
                      value: 0.45,
                      strokeWidth: 5.w,
                      color: AppColors.white,
                      backgroundColor: AppColors.white.withValues(alpha: 0.25),
                    ),
                  ),
                  Text(
                    '45%',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              AppSizes.s.verticalSpace,
              Text(
                'تم السداده',
                style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
