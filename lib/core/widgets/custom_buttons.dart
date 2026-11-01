import 'package:flutter/material.dart';
import 'package:masrofy_app/core/themes/app_sizes.dart';

enum ButtonVariant { primary, secondary, tertiary, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final double? width;
  final double? height;
  final Widget? icon;
  final bool isDisabled;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.variant,
    required this.isLoading,
    this.width,
    this.height,
    this.icon,
    required this.isDisabled,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppSizes.buttonM,
      child: _buildButton(theme),
    );
  }

  Widget _buildButton(ThemeData theme) {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton(
          onPressed: (isDisabled || isLoading) ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          child: _buildContent(Colors.white),
        );

      case ButtonVariant.secondary:
        return ElevatedButton(
          onPressed: (isDisabled || isLoading) ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.secondary,
            foregroundColor: Colors.white,
          ),
          child: _buildContent(Colors.white),
        );

      case ButtonVariant.tertiary:
        return ElevatedButton(
          onPressed: (isDisabled || isLoading) ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.tertiary,
            foregroundColor: Colors.white,
          ),
          child: _buildContent(Colors.white),
        );

      case ButtonVariant.outlined:
        return OutlinedButton(
          onPressed: (isDisabled || isLoading) ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: theme.colorScheme.primary),
            foregroundColor: theme.colorScheme.primary,
          ),
          child: _buildContent(theme.colorScheme.primary),
        );

      case ButtonVariant.text:
        return TextButton(
          onPressed: (isDisabled || isLoading) ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.primary,
          ),
          child: _buildContent(theme.colorScheme.primary),
        );
    }
  }

  Widget _buildContent(Color textColor) {
    if (isLoading) {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[icon!, SizedBox(width: AppSizes.s)],
        Text(text, style: textStyle),
      ],
    );
  }
}
