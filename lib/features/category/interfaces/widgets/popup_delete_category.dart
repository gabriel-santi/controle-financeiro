import 'package:finapp/shared/extensions/string_extension.dart';
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
        text: 'Excluir categoria'.hardcoded,
        weight: FontWeight.w500,
        size: MainTheme.fontSizeMedium + 2,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_rounded, color: Theme.of(context).colorScheme.tertiary, size: 50),
          TextWidget(
              maxLines: 5, size: MainTheme.fontSizeMedium - 2, text: 'Todas as transações vinculadas a essa categoria serão afetadas.'.hardcoded),
          TextWidget(
            text: 'Deseja mesmo excluir?'.hardcoded,
            size: MainTheme.fontSizeMedium - 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: TextWidget(text: 'Cancelar'.hardcoded),
        ),
        SizedBox(
          width: 150,
          child: CustomButtonWidget(
              color: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onSecondary,
              label: "Excluir".hardcoded,
              onClick: () => Navigator.pop(context, true)),
        ),
      ],
    );
  }
}
