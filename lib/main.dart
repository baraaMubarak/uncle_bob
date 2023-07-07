import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uncle_bob/core/color_schemes.dart';
import 'package:uncle_bob/feature/auth/presentation/bloc/forgot_and_delete_user_and_isauth/auth2_bloc.dart';
import 'package:uncle_bob/feature/auth/presentation/bloc/login_and_register_bloc/auth_bloc.dart';
import 'package:uncle_bob/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<Auth2Bloc>(),
        ),
        BlocProvider(
          create: (_) => di.sl<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: ThemeMode.dark,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo'),
          ),
          body: const Center(
            child: Text('Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}
