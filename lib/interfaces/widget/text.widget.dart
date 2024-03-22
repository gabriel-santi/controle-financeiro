import 'package:finapp/interfaces/theme/theme.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final Color? color;

  const TextWidget({super.key, required this.text, this.size, this.weight, this.maxLines, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
      style: TextStyle(
        fontSize: size ?? MainTheme.fontSizeMedium,
        fontWeight: weight ?? FontWeight.w300,
        color: color ?? Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
