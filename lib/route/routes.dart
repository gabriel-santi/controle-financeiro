import 'package:finapp/features/category/interfaces/category.page.dart';
import 'package:finapp/features/transaction/interfaces/add_transaction.page.dart';
import 'package:finapp/features/transaction/interfaces/edit_transaction.page.dart';
import 'package:finapp/features/transaction/interfaces/home.page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home('home'),
  transactionCreate('transactionCreate'),
  transactionEdit('transactionEdit'),
  category('category');

  final String name;

  const AppRoute(this.name);
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'transaction/new',
          name: AppRoute.transactionCreate.name,
          builder: (context, state) => const AddTransactionPage(),
        ),
        GoRoute(
          path: 'transaction/:id',
          name: AppRoute.transactionEdit.name,
          builder: (context, state) {
            final transactionId = int.parse(state.pathParameters["id"]!);
            return EditTransactionPage(transactionId: transactionId);
          },
        ),
        GoRoute(
          path: 'category',
          name: AppRoute.category.name,
          builder: (context, state) => const CategoryPage(),
        ),
      ],
    ),
  ],
);
