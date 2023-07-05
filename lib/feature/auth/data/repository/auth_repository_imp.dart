import 'package:dartz/dartz.dart';
import 'package:uncle_bob/core/error/exception.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/core/network/network_info.dart';
import 'package:uncle_bob/feature/auth/data/datasources/local_datasource.dart';
import 'package:uncle_bob/feature/auth/data/datasources/remote_datasource.dart';
import 'package:uncle_bob/feature/auth/data/models/user_model.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> isAuth(String userToken) async {
    if (await networkInfo.isConnected) {
      try {
        final isAuth = await remoteDataSource.isAuth(userToken);
        return Right(isAuth);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.getCachedUser();
        return const Right(true);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel data = await remoteDataSource.login(email, password);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, User>> register(User user) async {
    final UserModel userModel = UserModel(
      user.userName,
      user.email,
      user.firstName,
      user.lastName,
      user.gender,
      user.image,
      user.token,
    );
    if (await networkInfo.isConnected) {
      try {
        final UserModel data = await remoteDataSource.register(userModel);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(String userToken) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUser(userToken);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String code, String newPassword) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.forgotPassword(code, newPassword);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }
}
