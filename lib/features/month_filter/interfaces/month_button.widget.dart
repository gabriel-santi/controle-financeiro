import 'package:finapp/features/month_filter/interfaces/month_selector_overlay.dart';
import 'package:finapp/l10n/app_localizations.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthButtonWidget extends StatefulWidget {
  final VoidCallback? onChangeMonth;

  const MonthButtonWidget({
    super.key,
    required this.onChangeMonth,
  });

  @override
  State<MonthButtonWidget> createState() => _MonthButtonWidgetState();
}

class _MonthButtonWidgetState extends State<MonthButtonWidget> {
  final int selectedMonth = 1;

  void _selectMonth(int month) {
    // selectMonth(month);
    widget.onChangeMonth?.call();
  }

  @override
  Widget build(BuildContext context) {
    final months = List.generate(12, (index) {
      final formatter = DateFormat.MMMM(AppLocalizations.of(context).localeName.toString());
      final date = DateTime(2000, index + 1, 1);
      return formatter.format(date);
    });
    return GestureDetector(
      onTap: () => showModalBottomSheet(context: context, builder: (_) => MonthSelectorOverlay(selectedMonth: selectedMonth, onSelect: _selectMonth)),
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(MainTheme.radiusBig),
          ),
          child: Row(
            children: [
              const SizedBox(width: Sizes.p24),
              Icon(Icons.calendar_month_rounded, size: 18, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: Sizes.p8),
              TextWidget(
                text: months[selectedMonth - 1],
                color: Theme.of(context).colorScheme.primary,
                weight: FontWeight.w500,
                size: MainTheme.fontSizeSmall,
              ),
              const SizedBox(width: Sizes.p24),
              Icon(Icons.keyboard_arrow_down, size: 18, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: Sizes.p16),
            ],
          ),
        ),
      ),
    );
  }
}
