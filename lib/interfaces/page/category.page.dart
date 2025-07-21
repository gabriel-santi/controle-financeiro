import 'package:finapp/application/component/category.component.dart';
import 'package:finapp/application/state/category.state.dart';
import 'package:finapp/domain/category.dart';
import 'package:finapp/interfaces/configuration/module/app.module.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/back_button.widget.dart';
import 'package:finapp/interfaces/widget/button/custom_button.widget.dart';
import 'package:finapp/interfaces/widget/notification.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryComponent _categoryComponent = CategoryComponent();
  final TextEditingController _descriptionController = TextEditingController();
  final CategoryState _state = CategoryState.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _categoryComponent.initialize(AppModule.categoryRepo, _state, update);
    _getAllCategories();
  }

  void update() {
    if (mounted) setState(() {});
  }

  bool get isEditingCategory => _state.selectedCategory != null;

  Color _selectedColor = Colors.greenAccent;

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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    autofocus: false,
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
                              onClick: _cancelEditing),
                          SizedBox(width: MainTheme.spacing),
                          SizedBox(
                            width: 200,
                            child: CustomButtonWidget(
                                label: "Salvar", textColor: Theme.of(context).colorScheme.onSecondary, onClick: _saveCategory),
                          ),
                        ]
                      : [
                          SizedBox(
                              width: 150,
                              child: CustomButtonWidget(
                                  label: "Criar", textColor: Theme.of(context).colorScheme.onSecondary, onClick: _saveCategory))
                        ],
                ),
                SizedBox(height: MainTheme.spacing * 4),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _state.categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: MainTheme.spacing),
                  itemBuilder: (context, index) {
                    Category category = _state.categories[index];
                    bool selected = _state.selectedCategory?.id == category.id;

                    return GestureDetector(
                      onTap: () => _selectTransaction(category),
                      child: Container(
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
                          border: selected ? Border.all(width: 1.5, color: Theme.of(context).colorScheme.primary) : null,
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
                            SizedBox(width: MainTheme.spacing),
                            Icon(Icons.edit_outlined, color: Theme.of(context).colorScheme.onPrimary),
                            SizedBox(width: MainTheme.spacing),
                            TextWidget(text: category.description),
                            const Spacer(),
                            InkWell(
                                onTap: () => _onDeleteCategory(category.id),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: MainTheme.spacing * 2, vertical: MainTheme.spacing * 2),
                                  child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onPrimary.withOpacity(.8)),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: MainTheme.spacing * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getAllCategories() async {
    try {
      await _categoryComponent.getCategories();
    } catch (e) {
      showNotification("Não foi possível carregar categorias");
    }
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
                    label: "Selecionar",
                    textColor: Theme.of(context).colorScheme.onSecondary,
                    onClick: () => Navigator.pop(context, editingColor))),
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

  void _saveCategory() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      Category category = Category.load(
        isEditingCategory ? _state.selectedCategory!.id : -1,
        _descriptionController.text,
        _selectedColor.value.toString(),
      );

      await _categoryComponent.saveCategory(category);
      showNotification("Categoria salva com sucesso!", NotificationType.SUCCESS);
      _descriptionController.clear();
    } catch (e) {
      showNotification("Não foi possível salvar categoria");
    }
  }

  void _selectTransaction(Category category) {
    if (_state.selectedCategory?.id == category.id) return _cancelEditing();

    _categoryComponent.selectCategory(category);
    _descriptionController.text = category.description;
    _selectedColor = category.color;
    update();
  }

  void _cancelEditing() => _categoryComponent.selectCategory(null);

  void _onDeleteCategory(int id) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'Excluir categoria',
            weight: FontWeight.w500,
            size: MainTheme.fontSizeMedium + 2,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_rounded, color: Theme.of(context).colorScheme.tertiary, size: 50),
              TextWidget(
                  maxLines: 5,
                  size: MainTheme.fontSizeMedium - 2,
                  text: 'Todas as transações vinculadas a essa categoria serão afetadas.'),
              TextWidget(
                text: 'Deseja mesmo excluir?',
                size: MainTheme.fontSizeMedium - 2,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const TextWidget(text: 'Cancelar'),
            ),
            SizedBox(
              width: 150,
              child: CustomButtonWidget(
                  color: Theme.of(context).colorScheme.error,
                  textColor: Theme.of(context).colorScheme.onSecondary,
                  label: "Excluir",
                  onClick: () => Navigator.pop(context, true)),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    try {
      await _categoryComponent.deleteCategory(id);
      showNotification("Categoria excluída com sucesso!", NotificationType.SUCCESS);
    } catch (e) {
      showNotification("Não foi possível excluir categoria");
    }
  }
}
