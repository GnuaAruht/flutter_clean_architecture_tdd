import 'package:flutter_clean_architecture_tdd/features/get_users/data/model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUserList();
}
