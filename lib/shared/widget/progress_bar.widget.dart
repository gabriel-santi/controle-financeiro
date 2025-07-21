import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final MonetaryValue maxValue;
  final MonetaryValue currentValue;

  const ProgressBarWidget({super.key, required this.maxValue, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: currentValue.formattedValue(),
              size: MainTheme.fontSizeSmall,
            ),
            TextWidget(
              text: maxValue.formattedValue(),
              size: MainTheme.fontSizeSmall,
            ),
          ],
        ),
        IgnorePointer(
          ignoring: true,
          child: SliderTheme(
            data: SliderThemeData(
                trackHeight: 10, overlayShape: SliderComponentShape.noOverlay, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0)),
            child: Slider(
              max: maxValue.value,
              value: currentValue.value.clamp(0, maxValue.value),
              min: 0,
              inactiveColor: Theme.of(context).colorScheme.primary.withOpacity(.3),
              onChanged: (double value) {},
            ),
          ),
        ),
      ],
    );
  }
}
