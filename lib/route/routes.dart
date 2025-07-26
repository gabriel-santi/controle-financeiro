import 'package:finapp/features/category/interfaces/category.page.dart';
import 'package:finapp/features/language/interfaces/language.page.dart';
import 'package:finapp/features/transaction/interfaces/add_transaction.page.dart';
import 'package:finapp/features/transaction/interfaces/edit_transaction.page.dart';
import 'package:finapp/features/transaction/interfaces/home.page.dart';
import 'package:finapp/features/user/interfaces/username.page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home('home'),
  user('user'),
  language('language'),
  transactionCreate('transactionCreate'),
  transactionEdit('transactionEdit'),
  category('category');

  final String name;

  const AppRoute(this.name);
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
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
        GoRoute(
          path: 'user',
          name: AppRoute.user.name,
          builder: (context, state) => const UsernamePage(),
        ),
        GoRoute(
          path: 'language',
          name: AppRoute.language.name,
          builder: (context, state) => const LanguagePage(),
        ),
      ],
    ),
  ],
);
