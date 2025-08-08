import 'package:bloc_test/bloc_test.dart';
import 'package:finapp/features/user/application/user_bloc.dart';
import 'package:finapp/features/user/domain/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock.dart';

void main() {
  late MockUserRepo mockRepo;
  late UserBloc bloc;
  final testUser = User.create('Gabriel');

  setUp(() {
    mockRepo = MockUserRepo();
    bloc = UserBloc(mockRepo);
  });

  tearDown(() {
    bloc.close();
  });

  group('UserBloc', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] when LoadUser succeeds',
      build: () {
        when(() => mockRepo.getUser()).thenAnswer((_) async => testUser);
        return bloc;
      },
      act: (bloc) => bloc.add(LoadUser()),
      expect: () => [
        UserLoading(),
        UserLoaded(testUser),
      ],
      verify: (_) {
        verify(() => mockRepo.getUser()).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when LoadUser throws an exception',
      build: () {
        when(() => mockRepo.getUser()).thenThrow(Exception('Failed to load'));
        return bloc;
      },
      act: (bloc) => bloc.add(LoadUser()),
      expect: () => [
        UserLoading(),
        isA<UserError>().having((e) => e.message, 'message', contains('Failed')),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoaded] when SaveUser succeeds',
      build: () {
        when(() => mockRepo.saveUser(testUser)).thenAnswer((_) async => Future.value(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(SaveUser(testUser)),
      expect: () => [
        UserLoaded(testUser),
      ],
      verify: (_) {
        verify(() => mockRepo.saveUser(testUser)).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserError] when SaveUser throws an exception',
      build: () {
        when(() => mockRepo.saveUser(testUser)).thenThrow(Exception('Failed to save'));
        return bloc;
      },
      act: (bloc) => bloc.add(SaveUser(testUser)),
      expect: () => [
        isA<UserError>().having((e) => e.message, 'message', contains('Failed')),
      ],
    );
  });
}
