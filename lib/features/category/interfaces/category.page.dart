import 'package:finapp/features/category/interfaces/widgets/categories_list.widget.dart';
import 'package:finapp/features/category/interfaces/widgets/popup_select_color.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/back_button.widget.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/notification.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void update() {
    if (mounted) setState(() {});
  }

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
                    child: TextWidget(text: "Categorias".hardcoded, size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                false
                    ? TextWidget(text: "Editar categoria".hardcoded, weight: FontWeight.w400)
                    : TextWidget(text: "Nova categoria".hardcoded, weight: FontWeight.w400),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      label: TextWidget(text: "Descrição".hardcoded),
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
                        return '*Campo obrigatório'.hardcoded;
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
                          TextWidget(text: 'Cor'.hardcoded),
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
                  children: false
                      ? [
                          CustomButtonWidget(
                              label: "Cancelar".hardcoded,
                              color: Theme.of(context).colorScheme.error,
                              textColor: Theme.of(context).colorScheme.onSecondary,
                              onClick: _cancelEditing),
                          SizedBox(width: MainTheme.spacing),
                          SizedBox(
                            width: 200,
                            child: CustomButtonWidget(
                                label: "Salvar".hardcoded, textColor: Theme.of(context).colorScheme.onSecondary, onClick: _saveCategory),
                          ),
                        ]
                      : [
                          SizedBox(
                              width: 150,
                              child: CustomButtonWidget(
                                  label: "Criar".hardcoded, textColor: Theme.of(context).colorScheme.onSecondary, onClick: _saveCategory))
                        ],
                ),
                SizedBox(height: MainTheme.spacing * 4),
                const CategoriesListWidget(),
                SizedBox(height: MainTheme.spacing * 2),
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
        return PopupSelectColor(selectedColor: _selectedColor);
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
      showNotification("Categoria salva com sucesso!".hardcoded, NotificationType.SUCCESS);
      _descriptionController.clear();
    } catch (e) {
      showNotification("Não foi possível salvar categoria".hardcoded);
    }
  }

  void _cancelEditing() {
    //  TODO
  }
}
