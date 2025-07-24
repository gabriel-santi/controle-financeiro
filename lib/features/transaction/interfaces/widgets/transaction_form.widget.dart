import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finapp/features/transaction/interfaces/widgets/currency_input.widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
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
            label: "Valor".hardcoded,
            controller: valueController,
            onSubmitted: (_) {
              FocusScope.of(context).unfocus();
              _descriptionFieldFocus.requestFocus();
            },
            formatters: [_formatter],
            validator: (_) {
              if (valueController.text.trim().isEmpty) return "*Campo obrigatório".hardcoded;
              return null;
            },
          ),
          const SizedBox(height: Sizes.p16),
          TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              label: TextWidget(text: "Descrição".hardcoded),
              alignLabelWithHint: true,
              border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
              contentPadding: const EdgeInsets.all(Sizes.p8),
            ),
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '*Campo obrigatório'.hardcoded;
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
