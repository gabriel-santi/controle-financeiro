import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/custom_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EmptyStateCategoryWidget extends StatelessWidget {
  const EmptyStateCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: Sizes.p8),
          SvgPicture.asset(
            'assets/images/svg/empty_state_category.svg',
            width: 150,
          ),
          const SizedBox(height: Sizes.p8),
          TextWidget(text: context.translatedString.nCategory(0), size: MainTheme.fontSizeSmall),
          const SizedBox(height: Sizes.p16),
          SizedBox(
            width: 200,
            child: CustomButtonWidget(
              label: context.translatedString.create,
              textColor: Theme.of(context).colorScheme.onPrimary,
              fontSize: MainTheme.fontSizeSmall,
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
              onClick: () => context.goNamed(AppRoute.category.name),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
