import 'package:finapp/features/month_filter/interfaces/month_selector.widget.dart';
import 'package:finapp/features/month_filter/interfaces/select_month.widget.dart';
import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:finapp/features/transaction/domain/transaction.dart';
import 'package:finapp/features/transaction/interfaces/widgets/limit_used.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_card.widget.dart';
import 'package:finapp/route/routes.dart';
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
  @override
  void initState() {
    super.initState();
  }

  void update() {
    if (mounted) setState(() {});
  }

  final int selectedMonth = 7;
  final transactions = [];

  void _getData() async {
    try {
      // await getTransactions();
    } catch (e) {
      showNotification("Não foi possível buscar transações", NotificationType.ERROR);
    }
  }

  void _onClickCard(Transaction transaction) {
    if (transaction is Payment) {
      // selectTransaction(transaction);
    }
  }

  void _onClickResume() {
    // Navigator.pushReplacementNamed(context, '/limit', arguments: EditLimitParameters(_limit, _currentValue));
  }

  void _selectMonth(int month) {
    // selectMonth(month);
    _getData();
  }

  void _openMonthSelector() {
    showModalBottomSheet(context: context, builder: (_) => MonthSelectorWidget(selectedMonth: selectedMonth, onSelect: _selectMonth));
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
                        text: 'Seja bem-vindo(a), ',
                        style: TextStyle(
                          fontSize: MainTheme.fontSizeSmall,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      TextSpan(
                        text: 'Username!',
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
                LimitUsedWidget(limit: MonetaryValue(5000), currentValue: MonetaryValue(2000), onClick: _onClickResume),
                SizedBox(height: MainTheme.spacing * 4),
                Center(
                  child: SelectMonthWidget(
                    selectedMonth: selectedMonth,
                    onClick: _openMonthSelector,
                  ),
                ),
                SizedBox(height: MainTheme.spacing),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transactions.length,
                    padding: EdgeInsets.symmetric(vertical: MainTheme.spacing),
                    separatorBuilder: (_, __) => SizedBox(height: MainTheme.spacing),
                    itemBuilder: (_, index) {
                      Transaction item = transactions[index];

                      return TransactionCardWidget(
                        description: item.description,
                        date: item.createdAtFormatted,
                        value: item.value.formattedValue(),
                        onClick: () => _onClickCard(item),
                      );
                    }),
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
