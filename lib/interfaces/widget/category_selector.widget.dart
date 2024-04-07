import 'package:finapp/domain/category.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/custom_button.widget.dart';
import 'package:finapp/interfaces/widget/empty_state/empty_state_category.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CategorySelectorWidget extends StatelessWidget {
  final int? categorySelected;
  final List<Category> categories;
  final Function(int) onSelectCategory;
  final Function() onAddCategory;

  const CategorySelectorWidget({
    super.key,
    required this.categorySelected,
    required this.categories,
    required this.onSelectCategory,
    required this.onAddCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(text: "Categoria", weight: FontWeight.w500),
        SizedBox(height: MainTheme.spacing),
        categories.isNotEmpty
            ? Wrap(
                spacing: MainTheme.spacing,
                runSpacing: MainTheme.spacing,
                children: _buildCategories(context),
              )
            : _buildEmptyState(context),
      ],
    );
  }

  List<Widget> _buildCategories(BuildContext context) {
    List<Widget> categoriesWidgets = [];

    for (int i = 0; i < categories.length; i++) {
      Category category = categories[i];
      bool selected = categorySelected == category.id;

      categoriesWidgets.add(FittedBox(
        child: CustomButtonWidget(
          label: category.description,
          fontSize: MainTheme.fontSizeSmall,
          onClick: () => onSelectCategory(category.id),
          color: selected ? category.color : Theme.of(context).colorScheme.background,
          border: Border.all(color: selected ? category.color : Theme.of(context).colorScheme.primary),
          textColor: selected ? Theme.of(context).colorScheme.onPrimary.withOpacity(.6) : Theme.of(context).colorScheme.primary,
        ),
      ));
    }

    categoriesWidgets.add(FittedBox(
      child: CustomButtonWidget(
        label: "Adicionar",
        textColor: Theme.of(context).colorScheme.onSecondary,
        fontSize: MainTheme.fontSizeSmall,
        icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary),
        onClick: onAddCategory,
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
    ));

    return categoriesWidgets;
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MainTheme.spacing),
          const EmptyStateCategoryWidget(),
          SizedBox(height: MainTheme.spacing * 2),
          SizedBox(
            width: 200,
            child: CustomButtonWidget(
              label: "Criar",
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: MainTheme.fontSizeSmall,
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary),
              onClick: onAddCategory,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
