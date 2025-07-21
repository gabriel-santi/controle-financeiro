import 'package:finapp/application/component/transaction.component.dart';
import 'package:finapp/application/state/category.state.dart';
import 'package:finapp/application/state/transaction.state.dart';
import 'package:finapp/domain/monetary_value.dart';
import 'package:finapp/domain/payment.dart';
import 'package:finapp/interfaces/configuration/module/app.module.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/button/back_button.widget.dart';
import 'package:finapp/interfaces/widget/category_selector.widget.dart';
import 'package:finapp/interfaces/widget/notification.widget.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:finapp/interfaces/widget/transaction_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditTransactionPage extends StatefulWidget {
  const EditTransactionPage({super.key});

  @override
  State<EditTransactionPage> createState() => _EditTransactionPageState();
}

class _EditTransactionPageState extends State<EditTransactionPage> {
  final TransactionComponent _component = TransactionComponent();
  final TransactionState _state = TransactionState.instance;
  final CategoryState _categoryState = CategoryState.instance;

  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _categoryController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _component.initialize(AppModule.transactionRepo, _state, AppModule.categoryRepo, _categoryState, update);
    _valueController.text = _state.selectedPayment!.value.formattedValue();
    _descriptionController.text = _state.selectedPayment!.description;
    _categoryController = _state.selectedPayment!.category;
  }

  void update() {
    if (mounted) setState(() {});
  }

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
                SizedBox(height: MainTheme.spacing * 2),
                const BackButtonWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MainTheme.spacing * 2),
                  child: Center(
                    child: TextWidget(text: "Editar transação", size: MainTheme.fontSizeLarge, weight: FontWeight.w400),
                  ),
                ),
                TransactionFormWidget(
                  valueController: _valueController,
                  descriptionController: _descriptionController,
                  formKey: _formKey,
                ),
                SizedBox(height: MainTheme.spacing * 4),
                CategorySelectorWidget(
                  categorySelected: _categoryController,
                  categories: _categoryState.categories,
                  onSelectCategory: _onSelectCategory,
                  onAddCategory: _navigateToCategories,
                ),
                SizedBox(height: MainTheme.spacing * 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _onDelete,
                      style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith(
                              (states) => EdgeInsets.symmetric(vertical: MainTheme.spacing, horizontal: MainTheme.spacing * 4)),
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.error),
                          shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(MainTheme.radiusMedium)))),
                      child: TextWidget(
                        text: 'Excluir',
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                    SizedBox(width: MainTheme.spacing * 2),
                    ElevatedButton(
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectCategory(int category) {
    if (category == _categoryController) {
      _categoryController = null;
    } else {
      _categoryController = category;
    }
    update();
  }

  void _navigateToCategories() {
    Navigator.pushNamed(context, '/category').whenComplete(() => update());
  }

  void _onSave() async {
    if (_formKey.currentState!.validate() == false) return;

    try {
      final NumberFormat formatter = NumberFormat.currency(locale: 'pt-br', symbol: 'R\$');
      final double value = formatter.parse(_valueController.text).toDouble();
      final String description = _descriptionController.text;
      Payment paymentSelected = _state.selectedPayment as Payment;
      Payment paymentUpdated = paymentSelected.copyWith(
        value: MonetaryValue(value),
        description: description,
        lastUpdate: DateTime.now(),
        category: _categoryController,
      );
      await _component.savePayment(paymentUpdated);
      showNotification("Transação salva com sucesso!", NotificationType.SUCCESS);
      if (mounted) Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showNotification("Não foi possível salvar a transação!", NotificationType.ERROR);
    }
  }

  void _onDelete() async {
    try {
      await _component.deletePayment(_state.selectedPayment!.id);
      showNotification("Transação excluída com sucesso!", NotificationType.SUCCESS);
      if (mounted) Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showNotification("Não foi possível salvar a transação!", NotificationType.ERROR);
    }
  }
}
