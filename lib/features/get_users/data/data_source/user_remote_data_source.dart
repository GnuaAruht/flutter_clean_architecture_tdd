import '../../../../core/failure/exception.dart';
import '../model/user_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUserList();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final Client client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<List<UserModel>> getUserList() async {
    final response = await client.get(
        Uri.parse('https://61b4635859c6ac00173010b7.mockapi.io/api/users'));

    if (response.statusCode == 200) {
      final List<dynamic> dynamicList = json.decode(response.body);
      final userListJson = dynamicList.cast<Map<String, dynamic>>().toList();
      final List<UserModel> userList =
          userListJson.map((jsonMap) => UserModel.fromJson(jsonMap)).toList();
      return userList;
    } else {
      throw ServerException();
    }
  }
}
