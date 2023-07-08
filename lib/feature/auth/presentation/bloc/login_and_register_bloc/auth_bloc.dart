import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/core/strings/error_strings.dart';
import 'package:uncle_bob/feature/auth/domain/entities/user.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/registre_usecase.dart';

import '../../../domain/usecase/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoadingAuthState());
        final failureOrUser = await loginUseCase(email: event.email, password: event.password);
        failureOrUser.fold(
          (failure) => {
            emit(
              ErrorAuthState(error: _mapFailureToMessage(failure)),
            ),
          },
          (user) => {
            emit(SuccessAuthState(user: user)),
          },
        );
      } else if (event is RegisterEvent) {
        emit(LoadingAuthState());
        final failureOrUser = await registerUseCase(event.user);
        failureOrUser.fold(
          (failure) => {
            emit(
              ErrorAuthState(error: _mapFailureToMessage(failure)),
            ),
          },
          (user) => {
            emit(SuccessAuthState(user: user)),
          },
        );
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return NO_INTERNET;
      case ServerFailure:
        return SERVER_ERROR;
      case EmptyCacheFailure:
        return NO_DATA_TO_SHOW;
      default:
        return UNEXPECTED_ERORR;
    }
  }
}
