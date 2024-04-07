import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyStateCategoryWidget extends StatelessWidget {
  const EmptyStateCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/empty_state_category.svg',
          width: 150,
        ),
        SizedBox(height: MainTheme.spacing),
        TextWidget(text: "Nenhuma categoria criada", size: MainTheme.fontSizeSmall),
      ],
    );
  }
}
