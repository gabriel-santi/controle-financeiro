import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  final Function()? onPressed;

  const BackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed != null ? onPressed!.call() : context.goNamed(AppRoute.home.name),
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
