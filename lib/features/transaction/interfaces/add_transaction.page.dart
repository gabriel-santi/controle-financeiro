import 'package:finapp/features/category/interfaces/widgets/category_selector.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_form.widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/back_button.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void update() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  formKey: _formKey,
                ),
                const SizedBox(height: Sizes.p32),
                CategorySelectorWidget(),
                const SizedBox(height: Sizes.p64),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ButtonStyle(
                        padding: WidgetStateProperty.resolveWith((states) => const EdgeInsets.symmetric(vertical: Sizes.p16, horizontal: Sizes.p32)),
                        backgroundColor: WidgetStateProperty.resolveWith((states) => Theme.of(context).colorScheme.primary),
                        shape: WidgetStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)))),
                    child: TextWidget(
                      text: context.translatedString.save,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.p16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() async {}
}
