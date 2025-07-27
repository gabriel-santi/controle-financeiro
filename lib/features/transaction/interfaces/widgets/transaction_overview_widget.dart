import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/interfaces/widgets/progress_bar.widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
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
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p32),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MainTheme.lightTheme.onSecondaryContainer),
                    borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(text: context.translatedString.spent),
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
              const SizedBox(width: Sizes.p16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p32),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MainTheme.lightTheme.onSecondaryContainer),
                    borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(text: context.translatedString.earn),
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
          const SizedBox(height: Sizes.p16),
          Container(
            padding: const EdgeInsets.all(Sizes.p32),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: MainTheme.lightTheme.onSecondaryContainer),
              borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: context.translatedString.percentageExpenses),
                TextWidget(
                    text: '${((totalSpent.value * 100) / totalEarned.value).toStringAsFixed(2)} %',
                    size: MainTheme.fontSizeLarge + 4,
                    color: Theme.of(context).colorScheme.onPrimary,
                    weight: FontWeight.w500),
                const SizedBox(height: Sizes.p16),
                ProgressBarWidget(maxValue: totalEarned, currentValue: totalSpent),
                const SizedBox(height: Sizes.p16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
