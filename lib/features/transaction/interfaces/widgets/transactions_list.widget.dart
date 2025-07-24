import 'package:finapp/features/category/interfaces/widgets/category_chip_widget.dart';
import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:finapp/features/transaction/domain/transaction.dart';
import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      Payment.load(1, "Lunch", DateTime.now(), DateTime.now(), MonetaryValue(26), 1, 1, false),
      Payment.load(2, "Cine", DateTime.now(), DateTime.now(), MonetaryValue(14), 1, 1, false),
      Payment.load(3, "Uber", DateTime.now(), DateTime.now(), MonetaryValue(25), 1, 1, false),
      Payment.load(4, "Dinner", DateTime.now(), DateTime.now(), MonetaryValue(52), 1, 1, false),
    ];

    return ListView.separated(
        itemCount: transactions.length,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        separatorBuilder: (_, __) => const SizedBox(height: Sizes.p8),
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
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(MainTheme.radiusMedium),
        ),
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12, vertical: Sizes.p16),
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
            const SizedBox(height: Sizes.p8),
            Row(
              children: [
                TextWidget(text: transaction.createdAtFormatted, size: MainTheme.fontSizeSmall),
                const SizedBox(width: Sizes.p8),
                const CategoryChipWidget(description: 'description', color: Color(0xFFFFBDBD))
              ],
            )
          ],
        ),
      ),
    );
  }
}
