import 'package:finapp/l10n/app_localizations.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthSelectorOverlay extends StatefulWidget {
  final int selectedMonth;
  final Function(int) onSelect;

  const MonthSelectorOverlay({super.key, required this.selectedMonth, required this.onSelect});

  @override
  State<MonthSelectorOverlay> createState() => _MonthSelectorOverlayState();
}

class _MonthSelectorOverlayState extends State<MonthSelectorOverlay> {
  late int _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = widget.selectedMonth;
  }

  void _selectMonth(int month) {
    setState(() {
      _selectedMonth = month;
    });
  }

  @override
  Widget build(BuildContext context) {
    final months = List.generate(12, (index) {
      final formatter = DateFormat.MMMM(AppLocalizations.of(context).localeName.toString());
      final date = DateTime(2000, index + 1, 1);
      return formatter.format(date);
    });
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MainTheme.radiusBig + 4),
          topRight: Radius.circular(MainTheme.radiusBig + 4),
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16, vertical: Sizes.p8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.1),
                borderRadius: BorderRadius.circular(MainTheme.radiusBig),
              ),
            ),
          ),
          const SizedBox(height: Sizes.p8),
          Align(alignment: Alignment.centerLeft, child: TextWidget(text: context.translatedString.selectedMonth)),
          const SizedBox(height: Sizes.p8),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 50,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: months.length,
            itemBuilder: (_, i) => GestureDetector(
              onTap: () => _selectMonth(i + 1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: _selectedMonth == i + 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                ),
                child: Center(
                  child: TextWidget(
                    text: months[i],
                    size: MainTheme.fontSizeSmall,
                    color: _selectedMonth == i + 1 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          CustomButtonWidget(
              label: context.translatedString.select,
              borderRadius: MainTheme.radiusBig,
              padding: const EdgeInsets.all(Sizes.p16),
              textColor: Theme.of(context).colorScheme.onPrimary,
              onClick: () {
                Navigator.of(context).pop();
                widget.onSelect(_selectedMonth);
              }),
        ],
      ),
    );
  }
}
