import 'package:finapp/features/month_filter/interfaces/month_button.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/saudation_widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_overview_widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transactions_list.widget.dart';
import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/add_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int selectedMonth = 7;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing + 4, vertical: MainTheme.spacing * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MainTheme.spacing),
                const SaudationWidget(),
                SizedBox(height: MainTheme.spacing * 3),
                Center(
                  child: MonthButtonWidget(
                    onChangeMonth: () {
                      // TODO update transactions
                    },
                  ),
                ),
                SizedBox(height: MainTheme.spacing * 3),
                TransactionOverviewWidget(),
                Padding(
                  padding: EdgeInsets.only(top: MainTheme.spacing * 4, bottom: MainTheme.spacing),
                  child: TextWidget(
                    text: "Movimentações".hardcoded,
                    size: MainTheme.fontSizeLarge,
                    weight: FontWeight.w500,
                  ),
                ),
                const TransactionsListWidget(),
              ],
            ),
          ),
        ),
        floatingActionButton: AddButtonWidget(
          onClick: () => context.goNamed(AppRoute.transactionCreate.name),
        ),
      ),
    );
  }
}
