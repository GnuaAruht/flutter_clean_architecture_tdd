import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/entities/user.dart';

import 'package:flutter_clean_architecture_tdd/features/get_users/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/usecases/get_user_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_list_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetUserListUseCase getUserList;
  late MockUserRepository userRepository;

  const tempUsers = [
    User(
        id: '1',
        name: 'Ollie Cole',
        avatar: 'https://cdn.fakercloud.com/avatars/jpenico_128.jpg'),
    User(
        id: '2',
        name: 'Antoinette Pfeffer IV',
        avatar: 'https://cdn.fakercloud.com/avatars/toddrew_128.jpg'),
    User(
        id: '3',
        name: 'Brooke Langosh II',
        avatar: 'https://cdn.fakercloud.com/avatars/pmeissner_128.jpg'),
  ];

  setUp(() {
    userRepository = MockUserRepository();
    getUserList = GetUserListUseCase(userRepository);
  });

  test('should get user list from the repository', () async {
    when(userRepository.getUserList())
        .thenAnswer((realInvocation) async => const Right(tempUsers));

    final userList = await getUserList(NoParam());

    verify(userRepository.getUserList());
    expect(userList, const Right(tempUsers));
  });
}
