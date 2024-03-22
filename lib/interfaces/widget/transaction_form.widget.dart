import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionFormWidget extends StatelessWidget {
  final TextEditingController valueController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  TransactionFormWidget({
    super.key,
    required this.valueController,
    required this.descriptionController,
    required this.formKey,
  });

  final FocusNode _descriptionFieldFocus = FocusNode();
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(locale: "pt-br", minValue: 0, symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            autofocus: true,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
              _descriptionFieldFocus.requestFocus();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '*Campo obrigatório';
              }
              if (_formatter.getUnformattedValue() == 0) {
                return '*Valor inválido';
              }
              return null;
            },
            decoration: InputDecoration(
              label: const TextWidget(text: "Valor"),
              alignLabelWithHint: true,
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
              contentPadding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing),
            ),
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
            controller: valueController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, _formatter],
            style: TextStyle(fontSize: MainTheme.fontSizeLarge * 2),
          ),
          SizedBox(height: MainTheme.spacing * 4),
          TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              label: const TextWidget(text: "Descrição"),
              alignLabelWithHint: true,
              border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
              contentPadding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing),
            ),
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '*Campo obrigatório';
              }
              return null;
            },
            focusNode: _descriptionFieldFocus,
            controller: descriptionController,
            style: TextStyle(fontSize: MainTheme.fontSizeMedium),
          ),
        ],
      ),
    );
  }
}
