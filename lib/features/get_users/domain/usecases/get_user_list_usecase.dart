import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserListUseCase extends Usecase<List<User>, NoParam> {
  final UserRepository repository;

  GetUserListUseCase(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParam params) async {
    return repository.getUserList();
  }
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
