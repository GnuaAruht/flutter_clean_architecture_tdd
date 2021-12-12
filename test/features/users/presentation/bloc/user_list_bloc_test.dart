import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/core/failure/failure.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/entities/user.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/usecases/get_user_list_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/presentation/bloc/user_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_list_bloc_test.mocks.dart';

@GenerateMocks([GetUserListUseCase])
void main() {
  late MockGetUserListUseCase getUserListUseCase;
  late UserListBloc userListBloc;

  const userList = [
    User(id: 'id1', name: 'name1', avatar: 'avatar1'),
    User(id: 'id2', name: 'name2', avatar: 'avatar2'),
    User(id: 'id3', name: 'name3', avatar: 'avatar3'),
  ];

  setUp(() {
    getUserListUseCase = MockGetUserListUseCase();
    userListBloc = UserListBloc(getUserListUseCase);
  });

  test('should start bloc with InitState', () async {
    expect(userListBloc.state, const UserListState.initial());
  });

  group('GetUserList', () {
    test('should get user list from get user list usecase', () async {
      when(getUserListUseCase(any))
          .thenAnswer((_) async => const Right(userList));
      userListBloc.add(const UserListEvent.loadUserList());
      await untilCalled(getUserListUseCase(any));
      verify(getUserListUseCase(NoParam()));
    });
    test('should emit [Loading,Loaded] when data is gotten successfully',
        () async {
      when(getUserListUseCase(any))
          .thenAnswer((_) async => const Right(userList));
      const expected = [
        UserListState.loading(),
        UserListState.loaded(userList)
      ];
      expectLater(userListBloc.stream, emitsInOrder(expected));
      userListBloc.add(const UserListEvent.loadUserList());
    });
    test('should emit [Loading,Error] when data is gotten unsuccessfully',
        () async {
      when(getUserListUseCase(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      const expected = [
        UserListState.loading(),
        UserListState.error('Server Failure')
      ];
      expectLater(userListBloc.stream, emitsInOrder(expected));
      userListBloc.add(const UserListEvent.loadUserList());
    });
  });
}
