import 'package:finapp/interfaces/page/add_transaction.page.dart';
import 'package:finapp/interfaces/page/edit_parameters.page.dart';
import 'package:finapp/interfaces/page/edit_transaction.page.dart';
import 'package:finapp/interfaces/page/home.page.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => const HomePage(),
    '/transaction/create': (_) => const AddTransactionPage(),
    '/transaction/edit': (_) => const EditTransactionPage(),
    '/parameters': (_) => const EditParametersPage(),
  };
}
