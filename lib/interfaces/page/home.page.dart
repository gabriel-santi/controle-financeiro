import 'package:finapp/application/component/transaction.component.dart';
import 'package:finapp/application/state/transaction.state.dart';
import 'package:finapp/domain/transaction.dart';
import 'package:finapp/interfaces/configuration/module/app.module.dart';
import 'package:finapp/interfaces/page/parameter/edit_limit.parameter.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/bottom_bar.widget.dart';
import 'package:finapp/interfaces/widget/button/add_button.widget.dart';
import 'package:finapp/interfaces/widget/transaction_card.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TransactionComponent _component = TransactionComponent();
  final TransactionState _state = TransactionState.instance;

  @override
  void initState() {
    super.initState();
    _component.initialize(AppModule.transactionRepo, _state, update);
    _getTransactions();
  }

  void update() {
    if (mounted) setState(() {});
  }

  final double _limit = 1000;
  final double _currentValue = 800;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MainTheme.spacing * 2,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Seja bem vindo(a), ',
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
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _state.transactions.length,
                    padding: EdgeInsets.symmetric(vertical: MainTheme.spacing),
                    separatorBuilder: (_, __) => SizedBox(height: MainTheme.spacing),
                    itemBuilder: (_, index) {
                      Transaction item = _state.transactions[index];

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
          onClick: _onClickAdd,
        ),
        bottomNavigationBar: BottomBarWidget(
          maxValue: _limit,
          currentValue: _currentValue,
          onClick: _onClickBar,
        ),
      ),
    );
  }

  void _getTransactions() async {
    try {
      await _component.getTransactions();
    } catch (e) {
      print("Error ao buscar transações");
    }
  }

  void _onClickAdd() {
    Navigator.pushReplacementNamed(context, '/transaction/create');
  }

  void _onClickCard(Transaction transaction) {
    _component.selectTransaction(transaction);
    Navigator.pushReplacementNamed(context, '/transaction/edit', arguments: transaction.id);
  }

  void _onClickBar() {
    Navigator.pushReplacementNamed(context, '/limit', arguments: EditLimitParameters(_limit, _currentValue));
  }
}
