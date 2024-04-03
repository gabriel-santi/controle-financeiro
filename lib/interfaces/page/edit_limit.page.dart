import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finapp/domain/monetary_value.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/back_button.widget.dart';
import 'package:finapp/interfaces/widget/input/currency_input.widget.dart';
import 'package:finapp/interfaces/widget/progress_bar.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';

class EditLimitPage extends StatefulWidget {
  const EditLimitPage({super.key});

  @override
  State<EditLimitPage> createState() => _EditLimitPageState();
}

class _EditLimitPageState extends State<EditLimitPage> {
  // double _currentAmount = 0;
  // double _currentLimit = 0;

  final TextEditingController _valueController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(locale: "pt-br", minValue: 0, symbol: "R\$");

  @override
  void initState() {
    _valueController.addListener(() {
      setState(() {});
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // EditLimitParameters params = ModalRoute.of(context)!.settings.arguments as EditLimitParameters;
      // _currentAmount = params.currentValue;
      // _currentLimit = params.limitValue;

      // _valueController.text = _formatter.format(_currentLimit.toStringAsFixed(2));
      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MainTheme.spacing * 2),
                const BackButtonWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 2),
                  child: Center(
                    child: TextWidget(text: "Ajustar limite", size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: MainTheme.spacing * 4),
                Form(
                  key: _formKey,
                  child: CurrencyInputWidget(
                    label: "Valor",
                    controller: _valueController,
                    formatters: [_formatter],
                    validator: (_) {
                      if (_valueController.text.trim().isEmpty) return "*Campo obrigatório";
                      if (_formatter.getUnformattedValue() == 0) return "*Valor inválido";
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MainTheme.spacing * 2),
                ProgressBarWidget(maxValue: MonetaryValue.zero, currentValue: MonetaryValue.zero),
                SizedBox(height: MainTheme.spacing * 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.symmetric(vertical: MainTheme.spacing, horizontal: MainTheme.spacing * 4)),
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.primary),
                        shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)))),
                    child: TextWidget(
                      text: 'Salvar',
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    if (_formKey.currentState!.validate() == false) return;
  }
}
