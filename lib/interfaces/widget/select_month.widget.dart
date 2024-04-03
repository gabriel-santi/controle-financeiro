import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';

class SelectMonthWidget extends StatelessWidget {
  const SelectMonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.fromLTRB(MainTheme.spacing * 2, MainTheme.spacing / 2, MainTheme.spacing, MainTheme.spacing / 2),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(MainTheme.radiusBig),
        ),
        child: Row(
          children: [
            TextWidget(
              text: 'Abril',
              color: Theme.of(context).colorScheme.primary,
              size: MainTheme.fontSizeSmall,
            ),
            Icon(Icons.arrow_drop_down_outlined, color: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
