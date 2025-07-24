import 'package:finapp/features/month_filter/interfaces/month_button.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/greeting_widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_overview_widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transactions_list.widget.dart';
import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/add_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  int get durationGreetingAnimation => GreetingWidget.durationGreetingAnimation;

  int get delayTillOverviewAnimation => durationGreetingAnimation + 600;

  int get durationOverviewAnimation => 300;

  int get delayTillTransactionsAnimation => delayTillOverviewAnimation + durationOverviewAnimation + 600;

  int get durationTransactionAnimation => 400;

  int get delayTillShowFloatingButton => delayTillTransactionsAnimation + durationTransactionAnimation + 200;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              radius: 1,
              colors: [
                Color(0xFFA343FD),
                Color(0xFF402E6B),
                Color(0xFF140F24),
              ],
              stops: [0.1, 0.4, 1],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: CustomScrollView(
              slivers: [
                const SliverPadding(padding: EdgeInsets.only(top: Sizes.p16)),
                const SliverToBoxAdapter(child: GreetingWidget()),
                const SliverPadding(padding: EdgeInsets.only(top: Sizes.p24)),
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
                const SliverPadding(padding: EdgeInsets.only(top: Sizes.p24)),
                SliverToBoxAdapter(
                    child: TransactionOverviewWidget()
                        .animate(delay: Duration(milliseconds: delayTillOverviewAnimation + 400))
                        .fadeIn(duration: Duration(milliseconds: durationOverviewAnimation))
                        .slideY(begin: 0.8, end: 0, duration: Duration(milliseconds: durationOverviewAnimation))),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: Sizes.p32, bottom: Sizes.p8),
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
                const SliverPadding(padding: EdgeInsets.only(top: Sizes.p16)),
              ],
            ),
          ),
        ),
        floatingActionButton: AddButtonWidget(
          onClick: () => context.goNamed(AppRoute.transactionCreate.name),
        ).animate(delay: Duration(milliseconds: delayTillShowFloatingButton)).fadeIn(),
      ),
    );
  }
}
