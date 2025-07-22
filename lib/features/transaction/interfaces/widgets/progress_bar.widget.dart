import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final MonetaryValue maxValue;
  final MonetaryValue currentValue;

  const ProgressBarWidget({super.key, required this.maxValue, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
      ),
      clipBehavior: Clip.hardEdge,
      child: IgnorePointer(
        ignoring: true,
        child: SliderTheme(
          data: SliderThemeData(
              activeTrackColor: maxValue.value == currentValue.value ? Colors.red : Colors.greenAccent,
              trackHeight: 12,
              overlayShape: SliderComponentShape.noOverlay,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0)),
          child: Slider(
            max: maxValue.value,
            value: currentValue.value.clamp(0, maxValue.value),
            min: 0,
            inactiveColor: Theme.of(context).colorScheme.primary.withOpacity(.3),
            onChanged: (double value) {},
          ),
        ),
      ),
    );
  }
}
