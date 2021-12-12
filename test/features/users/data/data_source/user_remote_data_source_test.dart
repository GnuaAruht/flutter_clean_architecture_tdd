import 'package:flutter_clean_architecture_tdd/core/failure/exception.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/data/data_source/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixtures_reader.dart';
import 'user_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  late UserRemoteDataSource remoteDataSource;

  const userList = [
    UserModel(id: 'id1', name: 'name1', avatar: 'avatar1'),
    UserModel(id: 'id2', name: 'name2', avatar: 'avatar2'),
    UserModel(id: 'id3', name: 'name3', avatar: 'avatar3'),
  ];

  setUp(() {
    client = MockClient();
    remoteDataSource = UserRemoteDataSourceImpl(client);
  });

  group('Get User List', () {
    test(
        'should return user list when the call to remote data source is sucessful',
        () async {
      when(client.get(any)).thenAnswer(
          (_) async => http.Response(fixture('user_list.json'), 200));

      final result = await remoteDataSource.getUserList();
      verify(client.get(any));
      expect(result, userList);
    });

    test(
        'should throw ServerException when the call to remote data source is unsucessful',
        () async {
      when(client.get(any)).thenAnswer(
          (realInvocation) async => http.Response('Something went wrong', 404));
      final call = remoteDataSource.getUserList;
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
