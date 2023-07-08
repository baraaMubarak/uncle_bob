import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, User>> call({required String email, required String password}) async {
    return await authRepository.login(email, password);
  }
}
