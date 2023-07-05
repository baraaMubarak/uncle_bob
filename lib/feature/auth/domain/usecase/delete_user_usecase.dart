import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class DeleteUserUseCase {
  AuthRepository authRepository;

  DeleteUserUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call(String userToken) async {
    return await authRepository.deleteUser(userToken);
  }
}
