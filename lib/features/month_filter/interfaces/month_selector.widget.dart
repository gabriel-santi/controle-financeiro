import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class MonthSelectorWidget extends StatefulWidget {
  final int selectedMonth;
  final Function(int) onSelect;

  const MonthSelectorWidget({super.key, required this.selectedMonth, required this.onSelect});

  @override
  State<MonthSelectorWidget> createState() => _MonthSelectorWidgetState();
}

class _MonthSelectorWidgetState extends State<MonthSelectorWidget> {
  final List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MainTheme.radiusBig + 4),
          topRight: Radius.circular(MainTheme.radiusBig + 4),
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: MainTheme.spacing / 2),
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.1),
                borderRadius: BorderRadius.circular(MainTheme.radiusBig),
              ),
            ),
          ),
          SizedBox(height: MainTheme.spacing),
          const Align(alignment: Alignment.centerLeft, child: TextWidget(text: "Mês selecionado")),
          SizedBox(height: MainTheme.spacing),
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
                    color: _selectedMonth == i + 1 ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          CustomButtonWidget(
              label: "Selecionar",
              borderRadius: MainTheme.radiusBig,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: MainTheme.spacing * 2),
              textColor: Theme.of(context).colorScheme.onSecondary,
              onClick: () {
                Navigator.of(context).pop();
                widget.onSelect(_selectedMonth);
              }),
        ],
      ),
    );
  }
}
