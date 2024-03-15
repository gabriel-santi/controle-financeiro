import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final double maxValue;
  final double currentValue;
  const ProgressBarWidget({super.key, required this.maxValue, required this.currentValue});

  Color getColorByStatus(BuildContext context) {
    double percentageSpent = currentValue / maxValue;
    if (percentageSpent >= 0.7) {
      return Theme.of(context).colorScheme.error.withOpacity(.7);
    } else if (percentageSpent >= 0.6) {
      return Theme.of(context).colorScheme.tertiary.withOpacity(.7);
    }
    return Theme.of(context).colorScheme.primary.withOpacity(.3);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IgnorePointer(
        ignoring: true,
        child: Slider(
          max: maxValue,
          value: currentValue,
          min: 0,
          inactiveColor: getColorByStatus(context),
          onChanged: (double value) {},
        ),
      ),
    );
  }
}
