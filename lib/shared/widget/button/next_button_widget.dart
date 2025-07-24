import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final VoidCallback onClick;
  final bool isLoading;
  final bool enabled;

  const NextButtonWidget({super.key, required this.onClick, required this.isLoading, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: enabled ? onClick : null,
        tooltip: "Avançar".hardcoded,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(enabled ? 1 : .12),
        child: isLoading
            ? const CircularProgressIndicator()
            : Icon(
                size: 20,
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(enabled ? 1 : .38),
              ));
  }
}
