import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/back_button.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:finapp/interfaces/widget/transaction_form.widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing, vertical: MainTheme.spacing * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MainTheme.spacing * 2),
                const BackButtonWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 2),
                  child: Center(
                    child: TextWidget(text: "Adicionar transação", size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                TransactionFormWidget(
                  valueController: _valueController,
                  descriptionController: _descriptionController,
                  formKey: _formKey,
                ),
                SizedBox(height: MainTheme.spacing * 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.symmetric(vertical: MainTheme.spacing, horizontal: MainTheme.spacing * 4)),
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.primary),
                        shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)))),
                    child: TextWidget(
                      text: 'Salvar',
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    if (_formKey.currentState!.validate() == false) return;

    final double value = double.tryParse(_valueController.text.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
    final String description = _descriptionController.text;

    if (value == 0 || description.isEmpty) {
      return;
    }
  }
}
