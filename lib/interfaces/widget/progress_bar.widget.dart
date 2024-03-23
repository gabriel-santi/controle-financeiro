import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final double maxValue;
  final double currentValue;

  const ProgressBarWidget({super.key, required this.maxValue, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IgnorePointer(
        ignoring: true,
        child: Slider(
          max: maxValue,
          value: currentValue.clamp(0, maxValue),
          min: 0,
          inactiveColor: Theme.of(context).colorScheme.primary.withOpacity(.3),
          onChanged: (double value) {},
        ),
      ),
    );
  }
}
