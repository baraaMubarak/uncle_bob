import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call({required String code, required String newPassword}) async {
    return await authRepository.forgotPassword(code, newPassword);
  }
}
