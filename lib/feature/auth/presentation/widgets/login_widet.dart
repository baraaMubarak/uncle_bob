import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uncle_bob/core/extensions/context_extension.dart';
import 'package:uncle_bob/feature/auth/presentation/bloc/login_and_register_bloc/auth_bloc.dart';

class LoginWidget extends StatelessWidget {
  final String? errorMessage;

  LoginWidget({
    this.errorMessage,
    super.key,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.showSnackBar(text: errorMessage);
    });
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'TutorialKart',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController..text = 'kminchelle',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController..text = '0lelplR',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            child: const Text(
              'Forgot Password',
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: nameController.text, password: passwordController.text));
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Does not have account?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
