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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing + 6),
          child: CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.only(top: MainTheme.spacing * 2)),
              SliverToBoxAdapter(child: SizedBox(height: MainTheme.spacing)),
              SliverToBoxAdapter(child: const SaudationWidget().animate().fadeIn(duration: const Duration(milliseconds: 600))),
              SliverToBoxAdapter(child: SizedBox(height: MainTheme.spacing * 3)),
              SliverToBoxAdapter(
                child: Center(
                  child: MonthButtonWidget(
                    onChangeMonth: () {
                      // TODO update transactions
                    },
                  ).animate(delay: const Duration(milliseconds: 1500)).fadeIn(duration: const Duration(milliseconds: 300)),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: MainTheme.spacing * 3)),
              SliverToBoxAdapter(
                  child: TransactionOverviewWidget()
                      .animate(delay: const Duration(milliseconds: 1500))
                      .fadeIn(duration: const Duration(milliseconds: 300))
                      .slideY(begin: 0.8, end: 0, duration: const Duration(milliseconds: 300))),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: MainTheme.spacing * 4, bottom: MainTheme.spacing),
                  child: TextWidget(
                    text: "Movimentações".hardcoded,
                    size: MainTheme.fontSizeLarge,
                    weight: FontWeight.w500,
                  ).animate(delay: const Duration(milliseconds: 2200)).fadeIn(duration: const Duration(milliseconds: 400)),
                ),
              ),
              SliverFillRemaining(
                  child: const TransactionsListWidget()
                      .animate(delay: const Duration(milliseconds: 2200))
                      .fadeIn(duration: const Duration(milliseconds: 400))),
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
