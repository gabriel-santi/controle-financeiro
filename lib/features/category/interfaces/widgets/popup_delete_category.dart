import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class PopupDeleteCategory extends StatelessWidget {
  const PopupDeleteCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextWidget(
        text: context.translatedString.deleteCategory,
        weight: FontWeight.w500,
        size: MainTheme.fontSizeMedium + 2,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_rounded, color: Theme.of(context).colorScheme.tertiary, size: 50),
          TextWidget(
            maxLines: 5,
            size: MainTheme.fontSizeMedium - 2,
            text: context.translatedString.allTransactionsLinkedWillBeAffected,
          ),
          TextWidget(
            text: context.translatedString.deleteConfirmation,
            size: MainTheme.fontSizeMedium - 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: TextWidget(text: context.translatedString.cancel),
        ),
        SizedBox(
          width: 150,
          child: CustomButtonWidget(
              color: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onPrimary,
              label: context.translatedString.delete,
              onClick: () => Navigator.pop(context, true)),
        ),
      ],
    );
  }
}
