part of 'auth2_bloc.dart';

abstract class Auth2State extends Equatable {
  const Auth2State();

  @override
  List<Object> get props => [];
}

class Auth2Initial extends Auth2State {
  @override
  List<Object> get props => [];
}

class LoadingAuth2State extends Auth2State {}

class SuccessAuth2State extends Auth2State {
  final String message;

  const SuccessAuth2State(this.message);
}

class ErrorAuth2State extends Auth2State {
  final String message;

  const ErrorAuth2State({required this.message});
}
