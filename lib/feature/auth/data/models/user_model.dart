import 'package:uncle_bob/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
    super.userName,
    super.email,
    super.firstName,
    super.lastName,
    super.gender,
    super.image,
    super.token,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['userName'],
      json['email'],
      json['firstName'],
      json['lastName'],
      json['gender'],
      json['image'],
      json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "image": image,
      "token": token,
    };
  }
}
