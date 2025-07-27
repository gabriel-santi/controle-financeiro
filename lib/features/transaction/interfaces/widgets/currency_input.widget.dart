import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode? focus;
  final List<TextInputFormatter> formatters;
  final bool autofocus;
  final Function(String?)? validator;
  final Function(String)? onSubmitted;

  const CurrencyInputWidget(
      {super.key,
      required this.label,
      required this.controller,
      this.autofocus = true,
      this.focus,
      this.formatters = const [],
      this.validator,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      autofocus: autofocus,
      onFieldSubmitted: onSubmitted,
      validator: (value) {
        if (validator != null) return validator!(value);
        if (value == null || value.trim().isEmpty) {
          return context.translatedString.requiredField;
        }
        return null;
      },
      decoration: InputDecoration(
        label: TextWidget(text: label),
        alignLabelWithHint: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        contentPadding: const EdgeInsets.all(Sizes.p8),
      ),
      textAlign: TextAlign.center,
      keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly, ...formatters],
      style: TextStyle(fontSize: MainTheme.fontSizeLarge * 2),
    );
  }
}
