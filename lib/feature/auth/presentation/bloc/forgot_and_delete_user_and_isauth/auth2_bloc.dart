import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:uncle_bob/core/error/failure.dart';
import 'package:uncle_bob/core/strings/error_strings.dart';
import 'package:uncle_bob/core/strings/messages.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/delete_user_usecase.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/is_auth_usecase.dart';

import '../../../domain/usecase/forgot_password_usecase.dart';

part 'auth2_event.dart';
part 'auth2_state.dart';

class Auth2Bloc extends Bloc<Auth2Event, Auth2State> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final IsAuthUseCase isAuthUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  Auth2Bloc({
    required this.forgotPasswordUseCase,
    required this.isAuthUseCase,
    required this.deleteUserUseCase,
  }) : super(Auth2Initial()) {
    on<Auth2Event>((event, emit) async {
      if (event is ForgotPasswordAuth2Event) {
        emit(LoadingAuth2State());
        emit(
          await getState(
            () => forgotPasswordUseCase(
              newPassword: event.newPassword,
              code: event.code,
            ),
          ),
        );
      } else if (event is DeleteUserAuth2Event) {
        emit(LoadingAuth2State());

        emit(await getState(() => deleteUserUseCase(userToken: event.userToken)));
      } else if (event is IsAuthAuth2Event) {
        emit(LoadingAuth2State());
        final failureOrUnit = await isAuthUseCase(userToken: event.userToken);
        failureOrUnit.fold(
          (failure) => {emit(ErrorAuth2State(message: _mapFailureToMessage(failure)))},
          (_) => {emit(const SuccessAuth2State(RESET_YOUR_PASSWORD_IS_SUCCESS))},
        );
      }
    });
  }

  Future<Auth2State> getState(Future<Either<Failure, Unit>> Function() callBack) async {
    final failureOrUnit = await callBack();
    return failureOrUnit.fold(
      (failure) => ErrorAuth2State(
        message: _mapFailureToMessage(failure),
      ),
      (_) => const SuccessAuth2State(RESET_YOUR_PASSWORD_IS_SUCCESS),
    );
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
