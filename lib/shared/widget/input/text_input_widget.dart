import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputWidget extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final FocusNode? focus;
  final List<TextInputFormatter> formatters;
  final bool autofocus;
  final Function(String?)? validator;
  final Function(String)? onSubmitted;

  const TextInputWidget(
      {super.key,
      required this.label,
      required this.controller,
      this.focus,
      this.formatters = const [],
      this.autofocus = false,
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (validator != null) return validator!(value);
        if (value == null || value.trim().isEmpty) {
          return '*Campo obrigatório'.hardcoded;
        }
        return null;
      },
      decoration: InputDecoration(
        label: label != null ? TextWidget(text: label!) : null,
        alignLabelWithHint: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing),
      ),
      textAlign: TextAlign.center,
      controller: controller,
      inputFormatters: formatters,
      style: TextStyle(fontSize: MainTheme.fontSizeLarge),
    );
  }
}
