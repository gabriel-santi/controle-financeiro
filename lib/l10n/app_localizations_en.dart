import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get requiredField => 'Please fill out this field';

  @override
  String get askName => 'How would you like to be called?';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get next => 'Next';

  @override
  String get select => 'Select';

  @override
  String get create => 'Create';

  @override
  String get delete => 'Delete';

  @override
  String get deleteCategory => 'Delete category?';

  @override
  String get deleteConfirmation => 'Are you sure you want to delete?';

  @override
  String nCategory(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Categories',
      one: 'Category',
      zero: 'No categories found',
    );
    return '$_temp0';
  }

  @override
  String get editCategory => 'Edit category';

  @override
  String get newCategory => 'New category';

  @override
  String get categoryDeleteSuccess => 'Category deleted successfully';

  @override
  String get categoryDeleteFailure => 'Unable to delete category';

  @override
  String get categorySaveSuccess => 'Category saved successfully';

  @override
  String get categorySaveFailure => 'Unable to save category';

  @override
  String get transaction => 'Transaction';

  @override
  String get newTransaction => 'New transaction';

  @override
  String get editTransaction => 'Edit transaction';

  @override
  String get transactionDeleteSuccess => 'Transaction deleted successfully';

  @override
  String get transactionDeleteFailure => 'Unable to delete transaction';

  @override
  String get transactionSaveSuccess => 'Transaction saved successfully';

  @override
  String get transactionSaveFailure => 'Unable to save transaction';

  @override
  String get allTransactionsLinkedWillBeAffected => 'All transactions linked to this category will be affected';

  @override
  String get selectColor => 'Select a color';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get color => 'Color';

  @override
  String get description => 'Description';

  @override
  String get value => 'Amount';

  @override
  String get earn => 'Income';

  @override
  String get spent => 'Expense';

  @override
  String welcome(Object username) {
    return 'Welcome, $username';
  }

  @override
  String get moves => 'Transactions';

  @override
  String get percentageExpenses => 'Expense percentage';

  @override
  String get selectedMonth => 'Selected month';
}
