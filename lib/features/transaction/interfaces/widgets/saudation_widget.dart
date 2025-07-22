import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class SaudationWidget extends StatelessWidget {
  const SaudationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String user = "Username";
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Seja bem-vindo(a), '.hardcoded,
            style: TextStyle(
              fontSize: MainTheme.fontSizeSmall,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          TextSpan(
            text: "$user!",
            style: TextStyle(
              fontSize: MainTheme.fontSizeMedium,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
