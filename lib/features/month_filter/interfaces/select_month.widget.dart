import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class SelectMonthWidget extends StatelessWidget {
  final int selectedMonth;
  final Function() onClick;

  SelectMonthWidget({
    super.key,
    required this.selectedMonth,
    required this.onClick,
  });

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
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
