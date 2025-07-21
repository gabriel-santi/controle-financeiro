import 'package:finapp/features/month_filter/interfaces/select_month.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/limit_used.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transactions_list.widget.dart';
import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/add_button.widget.dart';
import 'package:finapp/shared/widget/notification.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int selectedMonth = 7;

  void _getData() async {
    try {
      // await getTransactions();
    } catch (e) {
      showNotification("Não foi possível buscar transações".hardcoded, NotificationType.ERROR);
    }
  }

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
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Seja bem-vindo(a), '.hardcoded,
                        style: TextStyle(
                          fontSize: MainTheme.fontSizeSmall,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      TextSpan(
                        text: 'Username!'.hardcoded,
                        style: TextStyle(
                          fontSize: MainTheme.fontSizeMedium,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MainTheme.spacing),
                LimitUsedWidget(),
                SizedBox(height: MainTheme.spacing * 4),
                Center(
                  child: SelectMonthWidget(
                    onChangeMonth: () {
                      // TODO update transactions
                    },
                  ),
                ),
                SizedBox(height: MainTheme.spacing),
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
