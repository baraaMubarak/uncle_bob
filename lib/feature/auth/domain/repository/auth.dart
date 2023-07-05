import 'package:uncle_bob/feature/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login();
  Future<User> signup();
  Future<User> forgotPassword();
  Future<bool> deleteUser();
}
