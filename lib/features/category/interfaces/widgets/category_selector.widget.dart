import 'package:finapp/features/category/interfaces/widgets/empty_state_category.widget.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/custom_button.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CategorySelectorWidget extends StatelessWidget {
  CategorySelectorWidget({super.key});

  final categories = [];
  final int? categorySelected = null;

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
                children: [
                  for (int i = 0; i < categories.length; i++)
                    FittedBox(
                      child: CustomButtonWidget(
                        label: categories[i].description,
                        fontSize: MainTheme.fontSizeSmall,
                        onClick: () {},
                        color: categories[i].id == categorySelected ? categories[i].color : Theme.of(context).colorScheme.background,
                        border: Border.all(color: categories[i].id == categorySelected ? categories[i].color : Theme.of(context).colorScheme.primary),
                        textColor: categories[i].id == categorySelected
                            ? Theme.of(context).colorScheme.onPrimary.withOpacity(.6)
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  FittedBox(
                    child: CustomButtonWidget(
                      label: "Adicionar",
                      textColor: Theme.of(context).colorScheme.onSecondary,
                      fontSize: MainTheme.fontSizeSmall,
                      icon: Icon(Icons.add, size: 16, color: Theme.of(context).colorScheme.onSecondary),
                      onClick: () {
                        // TODO
                      },
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              )
            : const EmptyStateCategoryWidget(),
      ],
    );
  }
}
