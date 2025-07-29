import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get requiredField => 'Por favor, completa este campo';

  @override
  String get askName => '¿Cómo te gustaría que te llamen?';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get next => 'Siguiente';

  @override
  String get select => 'Seleccionar';

  @override
  String get create => 'Crear';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteCategory => '¿Eliminar categoría?';

  @override
  String get deleteConfirmation => '¿Estás seguro de que deseas eliminar?';

  @override
  String nCategory(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Categorías',
      one: 'Categoría',
      zero: 'No se encontraron categorías',
    );
    return '$_temp0';
  }

  @override
  String get editCategory => 'Editar categoría';

  @override
  String get newCategory => 'Nueva categoría';

  @override
  String get categoryDeleteSuccess => 'Categoría eliminada con éxito';

  @override
  String get categoryDeleteFailure => 'No se pudo eliminar la categoría';

  @override
  String get categorySaveSuccess => 'Categoría guardada con éxito';

  @override
  String get categorySaveFailure => 'No se pudo guardar la categoría';

  @override
  String get transaction => 'Transacción';

  @override
  String get newTransaction => 'Nueva transacción';

  @override
  String get editTransaction => 'Editar transacción';

  @override
  String get transactionDeleteSuccess => 'Transacción eliminada con éxito';

  @override
  String get transactionDeleteFailure => 'No se pudo eliminar la transacción';

  @override
  String get transactionSaveSuccess => 'Transacción guardada con éxito';

  @override
  String get transactionSaveFailure => 'No se pudo guardar la transacción';

  @override
  String get allTransactionsLinkedWillBeAffected => 'Todas las transacciones vinculadas a esta categoría se verán afectadas';

  @override
  String get selectColor => 'Selecciona un color';

  @override
  String get selectLanguage => 'Selecciona el idioma';

  @override
  String get color => 'Color';

  @override
  String get description => 'Descripción';

  @override
  String get value => 'Monto';

  @override
  String get earn => 'Ingreso';

  @override
  String get spent => 'Gasto';

  @override
  String get welcome => 'Bienvenido(a), ';

  @override
  String get moves => 'Movimientos';

  @override
  String get percentageExpenses => 'Porcentaje de gastos';

  @override
  String get selectedMonth => 'Mes seleccionado';
}
