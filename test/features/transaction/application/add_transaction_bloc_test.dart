import 'package:bloc_test/bloc_test.dart';
import 'package:finapp/features/transaction/application/add_transaction_bloc.dart';
import 'package:finapp/features/transaction/data/transaction_repository.dart';
import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock.dart';

void main() {
  late TransactionRepo repository;
  late AddTransactionBloc bloc;

  const description = 'Test';
  final value = MonetaryValue(1500.0);
  const categoryId = 123;

  setUp(() {
    repository = MockTransactionRepo();
    bloc = AddTransactionBloc(repository);
  });

  setUpAll(() {
    registerFallbackValue(Payment.create(description, value, categoryId, null, false));
  });

  group(
    "AddTransactionBloc",
    () {
      test("Initial state", () {
        expect(bloc.state, isA<AddTransactionInitial>());
      });

      blocTest<AddTransactionBloc, AddTransactionState>(
        "Success",
        build: () {
          // setup
          when(() => repository.savePayment(any())).thenAnswer((_) async => Future.value());
          return bloc;
        },
        act: (bloc) => bloc.add(CreationRequested(description: description, value: value, categoryId: categoryId)),
        expect: () => [
          AddTransactionLoading(),
          AddTransactionSuccess(),
        ], // states emited after the event was added
        verify: (_) {
          verify(() => repository.savePayment(any())).called(1);
        },
      );

      blocTest<AddTransactionBloc, AddTransactionState>(
        "Failure",
        build: () {
          // setup
          final exception = Exception('Impossible to save');
          when(() => repository.savePayment(any())).thenThrow(exception);
          return bloc;
        },
        act: (bloc) => bloc.add(CreationRequested(description: description, value: value, categoryId: categoryId)),
        expect: () => [
          AddTransactionLoading(),
          isA<AddTransactionFailure>(),
        ], // states emited after the event was added
        verify: (_) {
          verify(() => repository.savePayment(any())).called(1);
        },
      );
    },
  );
}
