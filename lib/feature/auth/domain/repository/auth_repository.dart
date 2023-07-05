import 'package:dartz/dartz.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login();

  Future<Either<Failure, User>> signup();

  Future<Either<Failure, Unit>> forgotPassword();

  Future<Either<Failure, Unit>> deleteUser();
}
