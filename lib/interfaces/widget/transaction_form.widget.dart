import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/input/currency_input.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';

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
          CurrencyInputWidget(
            label: "Valor",
            controller: valueController,
            onSubmitted: (_) {
              FocusScope.of(context).unfocus();
              _descriptionFieldFocus.requestFocus();
            },
            formatters: [_formatter],
            validator: (_) {
              if (valueController.text.trim().isEmpty) return "*Campo obrigatório";
              if (_formatter.getUnformattedValue() == 0) return "*Valor inválido";
              return null;
            },
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
