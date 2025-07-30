import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finapp/features/category/interfaces/widgets/category_selector.widget.dart';
import 'package:finapp/features/transaction/data/transaction_repository.dart';
import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/interfaces/bloc/add_transaction_bloc.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_form.widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/back_button.widget.dart';
import 'package:finapp/shared/widget/button/primary_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formatter = CurrencyTextInputFormatter(locale: "pt-br", minValue: 0, symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTransactionBloc(TransactionSqfliteRepo.instance),
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(Sizes.p16).copyWith(bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Sizes.p16),
                  const BackButtonWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                    child: Center(
                      child: TextWidget(text: context.translatedString.newTransaction, size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                    ),
                  ),
                  TransactionFormWidget(
                    valueController: _valueController,
                    descriptionController: _descriptionController,
                    formatter: _formatter,
                    formKey: _formKey,
                  ),
                  const SizedBox(height: Sizes.p32),
                  CategorySelectorWidget(),
                  const SizedBox(height: Sizes.p64),
                  Align(
                    alignment: Alignment.centerRight,
                    child: PrimaryButtonWidget(
                      label: context.translatedString.save,
                      loading: false,
                      onClick: _onSave,
                    ),
                  ),
                  const SizedBox(height: Sizes.p16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    //todo read the cubit of category
    int category = 0;
    MonetaryValue value = MonetaryValue(_formatter.getUnformattedValue() as double);
    BlocProvider.of<AddTransactionBloc>(context).add(CreationRequested(
      description: _descriptionController.text.trim(),
      value: value,
      categoryId: category,
    ));
  }
}
