import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_tdd/core/failure/failure.dart';
import 'package:flutter_clean_architecture_tdd/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/entities/user.dart';
import 'package:flutter_clean_architecture_tdd/features/get_users/domain/repositories/user_repository.dart';

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
