import 'package:finapp/features/category/interfaces/widgets/category_selector.widget.dart';
import 'package:finapp/features/transaction/interfaces/widgets/transaction_form.widget.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
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

  @override
  void initState() {
    super.initState();
  }

  void update() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MainTheme.spacing * 2, vertical: MainTheme.spacing * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonWidget(),
                    IconButton(
                        onPressed: _onDelete,
                        padding: EdgeInsets.all(MainTheme.spacing + 4),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 26,
                          color: MainTheme.lightTheme.error,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 2),
                  child: Center(
                    child: TextWidget(text: "Editar transação".hardcoded, size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                TransactionFormWidget(
                  valueController: _valueController,
                  descriptionController: _descriptionController,
                  formKey: _formKey,
                ),
                SizedBox(height: MainTheme.spacing * 4),
                CategorySelectorWidget(),
                SizedBox(height: MainTheme.spacing * 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _onSave,
                      style: ButtonStyle(
                          padding: WidgetStateProperty.resolveWith(
                              (states) => EdgeInsets.symmetric(vertical: MainTheme.spacing * 2, horizontal: MainTheme.spacing * 4)),
                          backgroundColor: WidgetStateProperty.resolveWith((states) => Theme.of(context).colorScheme.primary),
                          shape: WidgetStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)))),
                      child: TextWidget(
                        text: 'Salvar'.hardcoded,
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
      showNotification("Transação salva com sucesso!".hardcoded, NotificationType.SUCCESS);
      if (mounted) Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showNotification("Não foi possível salvar a transação!".hardcoded, NotificationType.ERROR);
    }
  }

  void _onDelete() async {
    try {
      showNotification("Transação excluída com sucesso!".hardcoded, NotificationType.SUCCESS);
      if (mounted) Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showNotification("Não foi possível salvar a transação!".hardcoded, NotificationType.ERROR);
    }
  }
}
