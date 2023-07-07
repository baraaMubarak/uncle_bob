import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, User>> call(User user) async {
    return await authRepository.register(user);
  }
}
