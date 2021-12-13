import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUserList();
}
