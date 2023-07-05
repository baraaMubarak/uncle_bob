import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  const User(this.userName, this.email, this.firstName, this.lastName, this.gender, this.image, this.token);

  @override
  List<Object?> get props => [
        userName,
        email,
        firstName,
        lastName,
        gender,
        image,
        token,
      ];
}
