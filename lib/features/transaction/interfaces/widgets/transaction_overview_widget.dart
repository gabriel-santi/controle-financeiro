import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/interfaces/widgets/progress_bar.widget.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class TransactionOverviewWidget extends StatelessWidget {
  TransactionOverviewWidget({super.key});

  final MonetaryValue totalEarned = MonetaryValue(2000);
  final MonetaryValue totalSpent = MonetaryValue(1200);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MainTheme.lightTheme.onSecondaryContainer),
                    borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(text: "Gasto".hardcoded),
                        TextWidget(
                          text: totalSpent.formattedValue(),
                          size: MainTheme.fontSizeLarge,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: MainTheme.spacing * 2),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MainTheme.lightTheme.onSecondaryContainer),
                    borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(text: "Ganho".hardcoded),
                        TextWidget(
                          text: totalEarned.formattedValue(),
                          size: MainTheme.fontSizeLarge,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MainTheme.spacing * 2),
          Container(
            padding: EdgeInsets.all(MainTheme.spacing * 4),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: MainTheme.lightTheme.onSecondaryContainer),
              borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: 'Percentual de Gastos	'.hardcoded),
                TextWidget(
                    text: '${((totalSpent.value * 100) / totalEarned.value).toStringAsFixed(2)} %',
                    size: MainTheme.fontSizeLarge + 4,
                    color: Theme.of(context).colorScheme.onPrimary,
                    weight: FontWeight.w500),
                SizedBox(height: MainTheme.spacing * 2),
                ProgressBarWidget(maxValue: totalEarned, currentValue: totalSpent),
                SizedBox(height: MainTheme.spacing * 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
