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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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














// class SummeryCard extends StatelessWidget {
//   const SummeryCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         HomeAppBar().paddingAll(AppSizes.s),
//         AppSizes.l.verticalSpace,
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: AppColors.walletGradient,
//             borderRadius: AppSizes.rXL.radius,
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.primary.withValues(alpha: 0.15),
//                 blurRadius: 15,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () {},
//                   borderRadius: AppSizes.rS.radius,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 4.w,
//                       vertical: 2.h,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'الملخص المالي',
//                           style: context.textTheme.titleMedium,
//                         ),
//                         AppSizes.s.horizontalSpace,
//                         Icon(
//                           // _obscureBalances
//                           //       ? Icons.visibility_off_outlined
//                           //       :
//                           Icons.vaccines_outlined,
//                           color: Colors.white,
//                           size: AppSizes.iconS,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               AppSizes.s.verticalSpace,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // استبدل الـ Row الخاطئ بهذا الكود
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment
//                         .spaceBetween, // هذه تدفع النص لليمين والصورة لليسار
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // القسم الأول: النصوص (يجب أن تكون داخل Column لترتيبها عمودياً)
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'اجمالي الرصيد',
//                             style: context.textTheme.bodyMedium?.copyWith(
//                               color: AppColors.white.withValues(alpha: 0.7),
//                             ),
//                           ),
//                           AppSizes
//                               .s
//                               .verticalSpace, // هنا تعمل بشكل سليم لأنها داخل Column
//                           // صف الرصيد والعملة
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline: TextBaseline.alphabetic,
//                             children: [
//                               Text(
//                                 '12,450',
//                                 style: context.textTheme.displayMedium
//                                     ?.copyWith(color: Colors.white),
//                               ),
//                               AppSizes
//                                   .s
//                                   .horizontalSpace, // لاحظ: استخدمنا مسافة أفقية هنا!
//                               Text(
//                                 'ريال يمني',
//                                 style: context.textTheme.titleMedium
//                                     ?.copyWith(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
    
//                       // القسم الثاني: الصورة
//                       Image.asset(
//                         AppAssets
//                             .summery, // تأكد من الإملاء هنا وفي ملف الثوابت!
//                         width: 100
//                             .w, // ملاحظة: 10.w في كودك كانت صغيرة جداً، كبرتها لتكون واضحة
//                         height: 100.h,
//                         fit: BoxFit.contain,
//                         errorBuilder: (context, error, stackTrace) {
//                           // هذه الدالة تمنع انهيار التطبيق لو كان اسم الصورة خاطئاً
//                           return const Icon(
//                             Icons.error_outline,
//                             color: Colors.red,
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   AppSizes.xs.verticalSpace,
//                   Container(
//                     height: 0.5,
//                     color: Colors.white.withValues(alpha: 0.3),
//                   ),
//                   AppSizes.s.verticalSpace,
//                   Row(
//                     children: [
//                       CardSubTitle(
//                         title: "اجمالي الدخل",
//                         value: "18000",
//                         color: AppColors.primaryLight,
//                       ),
//                       AppSizes.m.horizontalSpace,
    
//                       Container(
//                         width: 0.5,
//                         height: 34.h,
//                         color: Colors.white.withValues(alpha: 0.3),
//                       ),
//                       AppSizes.m.horizontalSpace,
//                       CardSubTitle(
//                         title: "اجمالي المصروف",
//                         value: "9200",
//                         color: AppColors.debt,
//                       ),
//                     ],
//                   ),
//                 ],
//               ).paddingAll(AppSizes.s),
//             ],
//           ),
//         ).paddingAll(AppSizes.m),
//       ],
//     );
//   }
// }

// class CardSubTitle extends StatelessWidget {
//   const CardSubTitle({
//     super.key,
//     required this.title,
//     required this.color,
//     required this.value,
//   });
//   final String title;
//   final Color color;
//   final String value;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           title,
//           style: context.textTheme.bodySmall?.copyWith(
//             color: AppColors.white.withValues(alpha: 0.7),
//           ),
//         ),
//         AppSizes.s.verticalSpace,
//         FittedBox(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.baseline,
//             textBaseline: TextBaseline.alphabetic,
//             children: [
//               Text(
//                 value,
//                 style: context.textTheme.titleMedium?.copyWith(color: color),
//               ),
//               AppSizes.s.horizontalSpace,
//               Text(
//                 'ريال يمني',
//                 style: context.textTheme.bodySmall?.copyWith(
//                   color: AppColors.primaryLight,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
