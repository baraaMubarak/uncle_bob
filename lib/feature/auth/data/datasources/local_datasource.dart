import 'package:dartz/dartz.dart';
import 'package:uncle_bob/feature/auth/data/models/user_model.dart';

abstract class LocalDataSource {
  Future<UserModel> getCachedUser();
  Future<Unit> cacheUser(UserModel userModel);
}

class LocalDataSourceImp implements LocalDataSource {
  @override
  Future<Unit> cacheUser(UserModel userModel) {
    // TODO: implement cacheUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCachedUser() {
    // TODO: implement getCachedUser
    throw UnimplementedError();
  }
}
