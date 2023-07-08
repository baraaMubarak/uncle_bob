import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:uncle_bob/core/error/exception.dart';
import 'package:uncle_bob/feature/auth/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(UserModel user);

  Future<Unit> forgotPassword(String code, String newPassword);

  Future<Unit> deleteUser(String userId);

  Future<bool> isAuth(String token);
}

// ignore: constant_identifier_names
const BASE_URL = 'https://dummyjson.com';

class RemoteDataSourceImp implements RemoteDataSource {
  http.Client client;

  RemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> register(UserModel user) async {
    final response = await client.post(
      Uri.parse('$BASE_URL/users/add'),
      headers: {'Content-Type': 'application/json'},
      body: {
        'firstName': user.firstName,
        'lastName': user.lastName,
        'userName': user.userName,
        'email': user.email,
        'gender': user.gender,
        'image': user.image,
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('$BASE_URL/auth/login'),
      // headers: {'Content-Type': 'application/json'},
      body: {'username': email, 'password': password},
    );
    if (response.statusCode == 200) {
      print(response.body);
      return UserModel.fromJson(json.decode(response.body.toString()));
    }
    throw ServerException();
  }

  @override
  Future<bool> isAuth(String token) {
    // // TODO: implement isAuth
    // throw UnimplementedError();
    return Future.value(true);
  }

  @override
  Future<Unit> deleteUser(String id) async {
    final response = await client.delete(
      Uri.parse('$BASE_URL/users/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      return Future.value(unit);
    }
    throw ServerException();
  }

  @override
  Future<Unit> forgotPassword(String code, String newPassword) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
