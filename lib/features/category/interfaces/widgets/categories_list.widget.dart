import 'package:finapp/features/category/domain/category.dart';
import 'package:finapp/features/category/interfaces/widgets/popup_delete_category.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/notification.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  void _openConfirmDialog(BuildContext context, int id) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => const PopupDeleteCategory(),
    );

    if (confirm != true) return;

    try {
      showNotification(context.translatedString.categoryDeleteSuccess, NotificationType.SUCCESS);
    } catch (e) {
      showNotification(context.translatedString.categoryDeleteFailure);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = [];
    const Category? selectedCategory = null;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(height: Sizes.p8),
      itemBuilder: (context, index) {
        Category category = categories[index];
        bool selected = selectedCategory?.id == category.id;

        return GestureDetector(
          onTap: () {
            // TODO on select category
          },
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
                const SizedBox(width: Sizes.p8),
                Icon(Icons.edit_outlined, color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(width: Sizes.p8),
                TextWidget(text: category.description),
                const Spacer(),
                InkWell(
                    onTap: () => _openConfirmDialog(context, category.id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16, vertical: Sizes.p16),
                      child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onPrimary.withOpacity(.8)),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
