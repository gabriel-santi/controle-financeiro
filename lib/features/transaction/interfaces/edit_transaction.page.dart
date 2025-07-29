import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finapp/features/category/interfaces/widgets/category_selector.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_form.widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/button/back_button.widget.dart';
import 'package:finapp/shared/widget/notification.widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class EditTransactionPage extends StatefulWidget {
  final int transactionId;

  const EditTransactionPage({super.key, required this.transactionId});

  @override
  State<EditTransactionPage> createState() => _EditTransactionPageState();
}

class _EditTransactionPageState extends State<EditTransactionPage> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formatter = CurrencyTextInputFormatter(locale: "pt-br", minValue: 0, symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonWidget(),
                    IconButton(
                        onPressed: _onDelete,
                        padding: const EdgeInsets.all(Sizes.p12),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 26,
                          color: MainTheme.lightTheme.error,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                  child: Center(
                    child: TextWidget(text: context.translatedString.editTransaction, size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
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
                const SizedBox(height: Sizes.p32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _onSave,
                      style: ButtonStyle(
                          padding:
                              WidgetStateProperty.resolveWith((states) => const EdgeInsets.symmetric(vertical: Sizes.p16, horizontal: Sizes.p32)),
                          backgroundColor: WidgetStateProperty.resolveWith((states) => Theme.of(context).colorScheme.primary),
                          shape: WidgetStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)))),
                      child: TextWidget(
                        text: context.translatedString.save,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() async {
    if (_formKey.currentState!.validate() == false) return;

    try {
      showNotification(context.translatedString.transactionSaveSuccess, NotificationType.SUCCESS);
      if (mounted) Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showNotification(context.translatedString.transactionSaveFailure, NotificationType.ERROR);
    }
  }

  void _onDelete() async {
    try {
      showNotification(context.translatedString.transactionDeleteSuccess, NotificationType.SUCCESS);
      if (mounted) Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showNotification(context.translatedString.transactionDeleteFailure, NotificationType.ERROR);
    }
  }
}
