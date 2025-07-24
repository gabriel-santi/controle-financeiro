import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
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
            'assets/svg/empty_state_category.svg',
            width: 150,
          ),
          const SizedBox(height: Sizes.p8),
          TextWidget(text: "Nenhuma categoria criada".hardcoded, size: MainTheme.fontSizeSmall),
          const SizedBox(height: Sizes.p16),
          SizedBox(
            width: 200,
            child: CustomButtonWidget(
              label: "Criar".hardcoded,
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: MainTheme.fontSizeSmall,
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary),
              onClick: () => context.goNamed(AppRoute.category.name),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
