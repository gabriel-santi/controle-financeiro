import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/add_button.widget.dart';
import 'package:finapp/interfaces/widget/bottom_bar.widget.dart';
import 'package:finapp/interfaces/widget/transaction_card.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    itemCount: 20,
                    padding: EdgeInsets.symmetric(vertical: MainTheme.spacing),
                    separatorBuilder: (_, __) => SizedBox(height: MainTheme.spacing),
                    itemBuilder: (_, index) => TransactionCardWidget(
                          description: "Transaction $index",
                          date: DateTime.now().toLocal().toString(),
                          value: "R\$${index * 10},00",
                          onClick: _onClickCard,
                        )),
              ],
            ),
          ),
        ),
        floatingActionButton: AddButtonWidget(
          onClick: _onClickAdd,
        ),
        bottomNavigationBar: BottomBarWidget(
          maxValue: 1000,
          currentValue: 800,
          onClick: _onClickBar,
        ),
      ),
    );
  }

  void _onClickAdd() {
    Navigator.pushNamed(context, '/transaction/create');
  }

  void _onClickCard() {
    //  TODO
  }

  void _onClickBar() {
    //  TODO
  }
}
