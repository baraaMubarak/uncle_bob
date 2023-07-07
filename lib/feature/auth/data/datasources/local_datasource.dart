import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncle_bob/core/error/exception.dart';
import 'package:uncle_bob/feature/auth/data/models/user_model.dart';

abstract class LocalDataSource {
  Future<UserModel> getCachedUser();

  Future<Unit> cacheUser(UserModel userModel);
}

class LocalDataSourceImp implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheUser(UserModel userModel) {
    Map user = userModel.toJson();
    sharedPreferences.setString('user', json.encode(user));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUser() async {
    final jsonString = sharedPreferences.getString('user');
    if (jsonString != null) {
      final Map<String, dynamic> jsonDecode = json.decode(jsonString);
      final UserModel userModel = UserModel.fromJson(jsonDecode);
      return Future.value(userModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
