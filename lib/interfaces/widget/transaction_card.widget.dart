import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';

class TransactionCardWidget extends StatelessWidget {
  final String description;
  final String date;
  final String value;
  final Function() onClick;

  const TransactionCardWidget({super.key, required this.description, required this.date, required this.value, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceTint,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(.15),
                blurRadius: 4,
                offset: const Offset(0, 2),
                spreadRadius: 0.8,
              )
            ],
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing+5, vertical: MainTheme.spacing*2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: description),
                TextWidget(text: value, weight: FontWeight.w400),
              ],
            ),
            SizedBox(height: MainTheme.spacing * 2),
            TextWidget(text: date, size: MainTheme.fontSizeSmall)
          ],
        ),
      ),
    );
  }
}
