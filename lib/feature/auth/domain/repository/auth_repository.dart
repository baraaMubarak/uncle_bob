import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, User>> register(User user);

  Future<Either<Failure, Unit>> forgotPassword(String code, String newPassword);

  Future<Either<Failure, Unit>> deleteUser(String userToken);

  Future<Either<Failure, bool>> isAuth(String userToken);
}
