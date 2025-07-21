import 'package:finapp/features/month_filter/interfaces/month_selector.widget.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class SelectMonthWidget extends StatelessWidget {
  final VoidCallback? onChangeMonth;

  SelectMonthWidget({
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
      onTap: () => showModalBottomSheet(context: context, builder: (_) => MonthSelectorWidget(selectedMonth: selectedMonth, onSelect: _selectMonth)),
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing * 3, vertical: MainTheme.spacing),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(MainTheme.radiusBig),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.2),
                blurRadius: 3,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_month_rounded, size: 18, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: MainTheme.spacing),
              TextWidget(
                text: months[selectedMonth - 1],
                color: Theme.of(context).colorScheme.primary,
                size: MainTheme.fontSizeSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
