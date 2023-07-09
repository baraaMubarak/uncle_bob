import 'package:flutter/material.dart';
import 'package:uncle_bob/core/responsive/responsive.dart';
import 'package:uncle_bob/feature/auth/presentation/widgets/login_widet.dart';

class LoginResponsive extends StatelessWidget {
  final String? errorMessage;
  const LoginResponsive({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LoginWidget(errorMessage: errorMessage),
      desktop: Center(
        child: SizedBox(
          width: 500,
          child: LoginWidget(errorMessage: errorMessage),
        ),
      ),
      tablet: Center(
        child: SizedBox(
          width: 500,
          child: LoginWidget(errorMessage: errorMessage),
        ),
      ),
      mobileLarge: Center(
        child: SizedBox(
          width: 500,
          child: LoginWidget(errorMessage: errorMessage),
        ),
      ),
    );
  }
}
