import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/core/failure/failure.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUserList();
}
