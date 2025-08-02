import 'package:finapp/features/category/interfaces/widgets/categories_list.widget.dart';
import 'package:finapp/features/category/interfaces/widgets/popup_select_color.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
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

  Color _selectedColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(left: Sizes.p8, right: Sizes.p8, top: Sizes.p16),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Sizes.p16),
                BackButtonWidget(onPressed: () => Navigator.pop(context)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                  child: Center(
                    child: TextWidget(text: context.translatedString.nCategory(2), size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                false
                    ? TextWidget(text: context.translatedString.editCategory, weight: FontWeight.w400)
                    : TextWidget(text: context.translatedString.newCategory, weight: FontWeight.w400),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      label: TextWidget(text: context.translatedString.description),
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
                        return context.translatedString.requiredField;
                      }
                      return null;
                    },
                    controller: _descriptionController,
                    style: TextStyle(fontSize: MainTheme.fontSizeMedium),
                  ),
                ),
                const SizedBox(height: Sizes.p16),
                InkWell(
                  onTap: _openColorPicker,
                  child: Container(
                      padding: const EdgeInsets.all(Sizes.p8),
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
                          TextWidget(text: context.translatedString.color),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
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
                const SizedBox(height: Sizes.p16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: false
                      ? [
                          CustomButtonWidget(
                              label: context.translatedString.cancel,
                              color: Theme.of(context).colorScheme.error,
                              textColor: Theme.of(context).colorScheme.onPrimary,
                              onClick: _cancelEditing),
                          const SizedBox(width: Sizes.p8),
                          SizedBox(
                            width: 200,
                            child: CustomButtonWidget(
                                label: context.translatedString.save, textColor: Theme.of(context).colorScheme.onPrimary, onClick: _saveCategory),
                          ),
                        ]
                      : [
                          SizedBox(
                              width: 150,
                              child: CustomButtonWidget(
                                  label: context.translatedString.create, textColor: Theme.of(context).colorScheme.onPrimary, onClick: _saveCategory))
                        ],
                ),
                const SizedBox(height: Sizes.p32),
                const CategoriesListWidget(),
                const SizedBox(height: Sizes.p16),
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
      showNotification(context.translatedString.categorySaveSuccess, NotificationType.SUCCESS);
      _descriptionController.clear();
    } catch (e) {
      showNotification(context.translatedString.categorySaveFailure);
    }
  }

  void _cancelEditing() {
    //  TODO
  }
}
