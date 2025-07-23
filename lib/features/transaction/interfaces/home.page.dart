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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  int get durationSaudationAnimation => SaudationWidget.durationSaudationAnimation;

  int get delayTillOverviewAnimation => durationSaudationAnimation + 600;

  int get durationOverviewAnimation => 300;

  int get delayTillTransactionsAnimation => delayTillOverviewAnimation + durationOverviewAnimation + 600;

  int get durationTransactionAnimation => 400;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing + 6),
          child: CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.only(top: MainTheme.spacing * 2)),
              SliverToBoxAdapter(child: SizedBox(height: MainTheme.spacing)),
              const SliverToBoxAdapter(child: SaudationWidget()),
              SliverToBoxAdapter(child: SizedBox(height: MainTheme.spacing * 3)),
              SliverToBoxAdapter(
                child: Center(
                  child: MonthButtonWidget(
                    onChangeMonth: () {
                      // TODO update transactions
                    },
                  )
                      .animate(delay: Duration(milliseconds: delayTillOverviewAnimation))
                      .fadeIn(duration: Duration(milliseconds: durationOverviewAnimation)),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: MainTheme.spacing * 3)),
              SliverToBoxAdapter(
                  child: TransactionOverviewWidget()
                      .animate(delay: Duration(milliseconds: delayTillOverviewAnimation + 400))
                      .fadeIn(duration: Duration(milliseconds: durationOverviewAnimation))
                      .slideY(begin: 0.8, end: 0, duration: Duration(milliseconds: durationOverviewAnimation))),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: MainTheme.spacing * 4, bottom: MainTheme.spacing),
                  child: TextWidget(
                    text: "Movimentações".hardcoded,
                    size: MainTheme.fontSizeLarge,
                    weight: FontWeight.w500,
                  )
                      .animate(delay: Duration(milliseconds: delayTillTransactionsAnimation))
                      .fadeIn(duration: Duration(milliseconds: durationTransactionAnimation)),
                ),
              ),
              SliverFillRemaining(
                  child: const TransactionsListWidget()
                      .animate(delay: Duration(milliseconds: delayTillTransactionsAnimation))
                      .fadeIn(duration: Duration(milliseconds: durationTransactionAnimation))),
              SliverPadding(padding: EdgeInsets.only(top: MainTheme.spacing * 2)),
            ],
          ),
        ),
        floatingActionButton: AddButtonWidget(
          onClick: () => context.goNamed(AppRoute.transactionCreate.name),
        ),
      ),
    );
  }
}
