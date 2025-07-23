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
        padding: EdgeInsets.all(MainTheme.spacing + 4),
        style: ButtonStyle(elevation: WidgetStateProperty.resolveWith((states) => 2)),
        icon: Icon(
          size: 20,
          Icons.chevron_left,
          color: Theme.of(context).colorScheme.onPrimary,
        ));
  }
}
