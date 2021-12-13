import '../../../../core/network/network_info.dart';
import '../data_source/user_remote_data_source.dart';
import '../../domain/entities/user.dart';
import '../../../../core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getUserList() async {
    if (await networkInfo.isConnected) {
      final userList = await remoteDataSource.getUserList();
      return Right(userList);
    } else {
      return Left(ServerFailure());
    }
  }
}
