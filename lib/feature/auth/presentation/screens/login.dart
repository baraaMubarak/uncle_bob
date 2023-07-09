import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uncle_bob/core/widgets/loading_widget.dart';
import 'package:uncle_bob/feature/auth/presentation/screens/login_responsive.dart';

import '../bloc/login_and_register_bloc/auth_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial || state is ErrorAuthState) {
          if (state is ErrorAuthState) {
            return LoginResponsive(
              errorMessage: state.error,
            );
          }
          return const LoginResponsive();
        } else if (state is LoadingAuthState) {
          return const LoadingWidget();
        } else if (state is SuccessAuthState) {
          return Text(state.user.toString());
        }
        return const Text('impossible case');
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        // title: const Text('Login'),
        );
  }
}
