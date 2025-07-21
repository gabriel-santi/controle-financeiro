import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/shared/widget/progress_bar.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class LimitUsedWidget extends StatelessWidget {
  final MonetaryValue limit;
  final MonetaryValue currentValue;
  final Function() onClick;

  const LimitUsedWidget({super.key, required this.limit, required this.currentValue, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.shadow,
        borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing * 2, vertical: MainTheme.spacing * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surfaceTint,
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.edit_outlined, size: 18, color: Theme.of(context).colorScheme.onPrimary),
            ),
            Center(child: TextWidget(text: 'Limite disponível', size: MainTheme.fontSizeSmall)),
            Center(
                child: TextWidget(
                    text: (limit - currentValue).formattedValue(),
                    size: MainTheme.fontSizeLarge + 4,
                    color: Theme.of(context).colorScheme.primary,
                    weight: FontWeight.w500)),
            SizedBox(height: MainTheme.spacing * 2),
            ProgressBarWidget(maxValue: limit, currentValue: currentValue),
            SizedBox(height: MainTheme.spacing * 2),
          ],
        ),
      ),
    );
  }
}
