import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Color? color;
  final Border? border;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? fontSize;
  final Color? textColor;
  final Function() onClick;

  const CustomButtonWidget(
      {super.key,
      required this.label,
      this.icon,
      this.color,
      this.border,
      this.borderRadius,
      required this.onClick,
      this.padding,
      this.fontSize,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(left: MainTheme.spacing / 2),
                child: icon,
              ),
            TextWidget(
              text: label,
              size: fontSize,
              color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
