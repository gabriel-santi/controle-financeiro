import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/custom_button.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyStateCategoryWidget extends StatelessWidget {
  const EmptyStateCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MainTheme.spacing),
          SvgPicture.asset(
            'assets/svg/empty_state_category.svg',
            width: 150,
          ),
          SizedBox(height: MainTheme.spacing),
          TextWidget(text: "Nenhuma categoria criada", size: MainTheme.fontSizeSmall),
          SizedBox(height: MainTheme.spacing * 2),
          SizedBox(
            width: 200,
            child: CustomButtonWidget(
              label: "Criar",
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: MainTheme.fontSizeSmall,
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary),
              onClick: () {},
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
