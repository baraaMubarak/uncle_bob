import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class IsAuthUseCase {
  AuthRepository authRepository;

  IsAuthUseCase({required this.authRepository});

  Future<Either<Failure, bool>> call({required String userToken}) async {
    return await authRepository.isAuth(userToken);
  }
}
