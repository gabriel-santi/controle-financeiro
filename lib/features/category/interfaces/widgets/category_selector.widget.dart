import 'package:finapp/features/category/domain/category.dart';
import 'package:finapp/features/category/interfaces/widgets/empty_state_category.widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CategorySelectorWidget extends StatelessWidget {
  CategorySelectorWidget({super.key});

  final categories = [
    Category.load(1, "Food", "#0xFF0000"),
    Category.load(2, "Study", "#0xFF0000"),
    Category.load(3, "Transport", "#0xFF0000"),
  ];
  final int? categorySelected = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: context.translatedString.nCategory(1), weight: FontWeight.w500),
        const SizedBox(height: Sizes.p8),
        categories.isNotEmpty
            ? Wrap(
                spacing: Sizes.p8,
                runSpacing: Sizes.p8,
                children: [
                  for (int i = 0; i < categories.length; i++)
                    FittedBox(
                      child: CustomButtonWidget(
                        label: categories[i].description,
                        fontSize: MainTheme.fontSizeSmall,
                        onClick: () {},
                        color: categories[i].id == categorySelected ? categories[i].color : Theme.of(context).colorScheme.surface,
                        border: Border.all(color: categories[i].id == categorySelected ? categories[i].color : Theme.of(context).colorScheme.primary),
                        textColor: categories[i].id == categorySelected
                            ? Theme.of(context).colorScheme.onPrimary.withOpacity(.6)
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  FittedBox(
                    child: CustomButtonWidget(
                      label: context.translatedString.create,
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
