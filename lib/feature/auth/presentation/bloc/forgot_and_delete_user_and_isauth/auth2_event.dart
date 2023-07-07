part of 'auth2_bloc.dart';

abstract class Auth2Event extends Equatable {
  const Auth2Event();
}

class ForgotPasswordAuth2Event extends Auth2Event {
  final String code;
  final String newPassword;

  const ForgotPasswordAuth2Event({
    required this.code,
    required this.newPassword,
  });

  @override
  List<Object> get props => [code, newPassword];
}

class IsAuthAuth2Event extends Auth2Event {
  final String userToken;

  const IsAuthAuth2Event({
    required this.userToken,
  });

  @override
  List<Object> get props => [userToken];
}

class DeleteUserAuth2Event extends Auth2Event {
  final String userToken;

  const DeleteUserAuth2Event({
    required this.userToken,
  });

  @override
  List<Object> get props => [userToken];
}
