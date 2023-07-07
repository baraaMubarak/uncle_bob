part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String error;

  const ErrorAuthState({required this.error});

  @override
  List<Object> get props => [error];
}

class SuccessAuthState extends AuthState {
  final User user;

  const SuccessAuthState({required this.user});

  @override
  List<Object> get props => [user];
}
