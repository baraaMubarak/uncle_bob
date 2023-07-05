import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call(String code, String newPassword) async {
    return await authRepository.forgotPassword(code, newPassword);
  }
}
