import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/feature/auth/data/datasources/local_datasource.dart';
import 'package:uncle_bob/feature/auth/data/datasources/remote_datasource.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AuthRepositoryImp({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(String userToken) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String code, String newPassword) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
