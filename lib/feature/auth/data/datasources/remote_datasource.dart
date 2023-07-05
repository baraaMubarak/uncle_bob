import 'package:dartz/dartz.dart';
import 'package:uncle_bob/feature/auth/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(UserModel user);

  Future<Unit> forgotPassword(String code, String newPassword);

  Future<Unit> deleteUser(String userId);
}

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<Unit> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Unit> forgotPassword(String code, String newPassword) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> register(UserModel user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
