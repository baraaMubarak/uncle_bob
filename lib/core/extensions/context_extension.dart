import 'package:flutter/material.dart';

extension MyContext on BuildContext {
  showSnackBar({required String? text, bool isError = true}) {
    if (text != null) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: isError ? Theme.of(this).errorColor : Colors.green,
        ),
      );
    }
  }
}
