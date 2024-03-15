import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/progress_bar.widget.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final double maxValue;
  final double currentValue;
  final Function() onClick;
  const BottomBarWidget({super.key, required this.maxValue, required this.currentValue, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing * 2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceTint,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MainTheme.radiusMedium),
            topRight: Radius.circular(MainTheme.radiusMedium),
          ),
        ),
        child: Center(
          child: ProgressBarWidget(maxValue: maxValue, currentValue: currentValue),
        ),
      ),
    );
  }
}
