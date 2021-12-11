import 'dart:convert';

import 'package:flutter_clean_architecture_tdd/features/get_users/data/model/user_model.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  const user = UserModel(id: 'id', name: 'name', avatar: 'avatar');

  test('Should be a subclass of User entity', () async {
    expect(user, isA<User>());
  });

  group('fromJson', () {
    test('should return valid model when parsing from json', () async {
      final jsonMap = json.decode(fixture('user.json'));
      final result = UserModel.fromJson(jsonMap);

      expect(result, user);
    });
  });

  group('toJson', () {
    test('should return a Json map containing proper data', () async {
      final result = user.toJson();

      final expectedMap = {"id": "id", "name": "name", "avatar": "avatar"};

      expect(result, expectedMap);
    });
  });
}
