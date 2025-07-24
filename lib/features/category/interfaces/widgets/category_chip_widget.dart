import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CategoryChipWidget extends StatelessWidget {
  final String description;
  final Color color;

  const CategoryChipWidget({super.key, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(.1),
            blurRadius: 3,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
        child: Center(
          child: TextWidget(
            text: description,
            color: Theme.of(context).colorScheme.surface,
            size: MainTheme.fontSizeSmall,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
