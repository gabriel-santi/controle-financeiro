import 'package:finapp/interfaces/theme/theme.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        padding: EdgeInsets.all(MainTheme.spacing + 2),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.secondary),
            shadowColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.shadow),
            elevation: MaterialStateProperty.resolveWith((states) => 2)),
        icon: Icon(
          Icons.chevron_left,
          color: Theme.of(context).colorScheme.onPrimary,
        ));
  }
}
