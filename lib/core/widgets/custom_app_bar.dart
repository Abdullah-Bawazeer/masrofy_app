import 'package:flutter/material.dart';
import 'package:masrofy_app/core/extensions/build_context.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return //headre row
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: context.theme.colorScheme.onBackground,
            size: AppSizes.iconM,
          ),
        ),
        Text(
          title,
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
            color: context.theme.colorScheme.onBackground,
            size: AppSizes.iconM,
          ),
        ),
      ],
    );
  }
}
