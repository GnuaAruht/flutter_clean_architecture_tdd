import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/core/failure/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
