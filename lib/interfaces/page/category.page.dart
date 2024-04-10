import 'package:finapp/domain/category.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/back_button.widget.dart';
import 'package:finapp/interfaces/widget/button/custom_button.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _descriptionController = TextEditingController();

  Color _selectedColor = Colors.greenAccent;

  // TODO move to state
  bool isEditingCategory = false;
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(left: MainTheme.spacing, right: MainTheme.spacing, top: MainTheme.spacing * 2),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MainTheme.spacing * 2),
                BackButtonWidget(onPressed: () => Navigator.pop(context)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 2),
                  child: Center(
                    child: TextWidget(text: "Categorias", size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                isEditingCategory
                    ? const TextWidget(text: "Editar categoria", weight: FontWeight.w400)
                    : const TextWidget(text: "Nova categoria", weight: FontWeight.w400),
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
                  controller: _descriptionController,
                  style: TextStyle(fontSize: MainTheme.fontSizeMedium),
                ),
                SizedBox(height: MainTheme.spacing * 2),
                InkWell(
                  onTap: _openColorPicker,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
                        color: _selectedColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.shadow.withOpacity(.1),
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const TextWidget(text: 'Cor'),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing),
                            child: TextWidget(
                              text: "#${_selectedColor.value}",
                              size: MainTheme.fontSizeSmall,
                              color: Theme.of(context).colorScheme.onPrimary.withOpacity(.5),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                        ],
                      )),
                ),
                SizedBox(height: MainTheme.spacing * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: isEditingCategory
                      ? [
                          CustomButtonWidget(
                              label: "Cancelar",
                              color: Theme.of(context).colorScheme.error,
                              textColor: Theme.of(context).colorScheme.onSecondary,
                              onClick: _saveCategory),
                          SizedBox(width: MainTheme.spacing),
                          SizedBox(
                            width: 200,
                            child: CustomButtonWidget(label: "Salvar", textColor: Theme.of(context).colorScheme.onSecondary, onClick: _saveCategory),
                          ),
                        ]
                      : [
                          SizedBox(
                              width: 150,
                              child: CustomButtonWidget(label: "Criar", textColor: Theme.of(context).colorScheme.onSecondary, onClick: _saveCategory))
                        ],
                ),
                SizedBox(height: MainTheme.spacing * 4),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(height: MainTheme.spacing),
                  itemBuilder: (context, index) {
                    // Category cat = categories[index];

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing * 2),
                      decoration: BoxDecoration(
                        // color: cat.color,
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.shadow.withOpacity(.1),
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, color: Theme.of(context).colorScheme.onPrimary),
                          SizedBox(width: MainTheme.spacing),
                          TextWidget(
                            // text: cat.description,
                            text: "Categoria",
                            weight: FontWeight.w500,
                          ),
                          const Spacer(),
                          InkWell(onTap: _onDeleteCategory, child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onPrimary)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openColorPicker() async {
    Color? c = await showDialog(
      context: context,
      builder: (context) {
        Color editingColor = _selectedColor;
        return AlertDialog(
          title: const TextWidget(text: 'Selecione uma cor'),
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
                setState(() {
                  editingColor = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const TextWidget(text: 'Cancelar'),
            ),
            SizedBox(
                width: 150,
                child: CustomButtonWidget(
                    label: "Selecionar", textColor: Theme.of(context).colorScheme.onSecondary, onClick: () => Navigator.pop(context, editingColor))),
          ],
        );
      },
    );

    if (c != null) {
      setState(() {
        _selectedColor = c;
      });
    }
  }

  void _saveCategory() {}

  void _onDeleteCategory() {}
}
