import 'package:finapp/features/month_filter/interfaces/month_selector_overlay.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class MonthButtonWidget extends StatelessWidget {
  final VoidCallback? onChangeMonth;

  MonthButtonWidget({
    super.key,
    required this.onChangeMonth,
  });

  final int selectedMonth = 1;

  final List<String> months = [
    'Janeiro'.hardcoded,
    'Fevereiro'.hardcoded,
    'Março'.hardcoded,
    'Abril'.hardcoded,
    'Maio'.hardcoded,
    'Junho'.hardcoded,
    'Julho'.hardcoded,
    'Agosto'.hardcoded,
    'Setembro'.hardcoded,
    'Outubro'.hardcoded,
    'Novembro'.hardcoded,
    'Dezembro'.hardcoded
  ];

  void _selectMonth(int month) {
    // selectMonth(month);
    onChangeMonth?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(context: context, builder: (_) => MonthSelectorOverlay(selectedMonth: selectedMonth, onSelect: _selectMonth)),
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: MainTheme.spacing),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(MainTheme.radiusBig),
          ),
          child: Row(
            children: [
              SizedBox(width: MainTheme.spacing * 3),
              Icon(Icons.calendar_month_rounded, size: 18, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: MainTheme.spacing),
              TextWidget(
                text: months[selectedMonth - 1],
                color: Theme.of(context).colorScheme.primary,
                weight: FontWeight.w500,
                size: MainTheme.fontSizeSmall,
              ),
              SizedBox(width: MainTheme.spacing * 3),
              Icon(Icons.keyboard_arrow_down, size: 18, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: MainTheme.spacing * 2),
            ],
          ),
        ),
      ),
    );
  }
}
