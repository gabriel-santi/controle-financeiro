import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onClick;

  const PrimaryButtonWidget({super.key, required this.label, required this.loading, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      label: label,
      color: Theme.of(context).colorScheme.primary.withOpacity(loading ? .38 : 1),
      suffixIcon: loading ? const SizedBox(width: 8, height: 8, child: CircularProgressIndicator()) : null,
      onClick: onClick,
    );
  }
}
