import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class PopupSelectColor extends StatelessWidget {
  final Color selectedColor;

  const PopupSelectColor({super.key, required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    Color editingColor = selectedColor;

    return AlertDialog(
      title: TextWidget(text: 'Selecione uma cor'.hardcoded),
      content: SingleChildScrollView(
        child: ColorPicker(
          color: editingColor,
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.both: false,
            ColorPickerType.primary: false,
            ColorPickerType.accent: false,
            ColorPickerType.bw: false,
            ColorPickerType.custom: false,
            ColorPickerType.wheel: true,
          },
          selectedColorIcon: Icons.check,
          onColorChanged: (color) {
            editingColor = color;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: TextWidget(text: 'Cancelar'.hardcoded),
        ),
        SizedBox(
            width: 150,
            child: CustomButtonWidget(
                label: "Selecionar".hardcoded,
                textColor: Theme.of(context).colorScheme.onSecondary,
                onClick: () => Navigator.pop(context, editingColor))),
      ],
    );
  }
}
