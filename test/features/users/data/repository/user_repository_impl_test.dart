import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/core/failure/failure.dart';
import 'package:flutter_clean_architecture_tdd/core/network/network_info.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/data/data_source/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/data/model/user_model.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/data/repository/user_repository_impl.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, UserRemoteDataSource])
void main() {
  late MockNetworkInfo networkInfo;
  late MockUserRemoteDataSource remoteDataSource;
  late UserRepository userRepository;

  const userList = [
    UserModel(id: 'id1', name: 'name1', avatar: 'avatar1'),
    UserModel(id: 'id2', name: 'name2', avatar: 'avatar2'),
    UserModel(id: 'id3', name: 'name3', avatar: 'avatar3')
  ];

  setUp(() {
    networkInfo = MockNetworkInfo();
    remoteDataSource = MockUserRemoteDataSource();
    userRepository = UserRepositoryImpl(
        networkInfo: networkInfo, remoteDataSource: remoteDataSource);
  });

  test('should check device online', () async {
    when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
    await userRepository.getUserList();
    verify(networkInfo.isConnected);
  });

  group('Online', () {
    test(
        "should return user list when call to remote data source is successful",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.getUserList()).thenAnswer((_) async => userList);
      final result = await userRepository.getUserList();
      verify(remoteDataSource.getUserList());
      expect(result, const Right(userList));
    });
  });

  group('Offline', () {
    test(
        "should return Server failure when call to remote data source is unsuccessful",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      final result = await userRepository.getUserList();
      verifyNoMoreInteractions(remoteDataSource);
      expect(result, Left(ServerFailure()));
    });
  });
}
