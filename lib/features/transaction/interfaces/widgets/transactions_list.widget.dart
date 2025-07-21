import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:finapp/features/transaction/domain/transaction.dart';
import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      Payment.load(1, "Lunch", DateTime.now(), DateTime.now(), MonetaryValue(10), 1, 1, false),
      Payment.load(2, "Cine", DateTime.now(), DateTime.now(), MonetaryValue(14), 1, 1, false),
      Payment.load(3, "Uber", DateTime.now(), DateTime.now(), MonetaryValue(25), 1, 1, false),
    ];

    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        padding: EdgeInsets.symmetric(vertical: MainTheme.spacing),
        separatorBuilder: (_, __) => SizedBox(height: MainTheme.spacing),
        itemBuilder: (_, index) {
          return TransactionCardWidget(transaction: transactions[index]);
        });
  }
}

class TransactionCardWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionCardWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(AppRoute.transactionEdit.name, pathParameters: {"id": transaction.id.toString()}),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceTint,
          borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
        ),
        padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing + 5, vertical: MainTheme.spacing * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: transaction.description),
                TextWidget(text: transaction.value.formattedValue(), weight: FontWeight.w400),
              ],
            ),
            SizedBox(height: MainTheme.spacing * 2),
            TextWidget(text: transaction.createdAtFormatted, size: MainTheme.fontSizeSmall)
          ],
        ),
      ),
    );
  }
}
