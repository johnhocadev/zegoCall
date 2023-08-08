
import 'package:flutter/material.dart';

class PasswordEditor extends StatelessWidget {
  const PasswordEditor({
    super.key,
    required ValueNotifier<bool> passwordVisible,
  }) : _passwordVisible = passwordVisible;

  final ValueNotifier<bool> _passwordVisible;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _passwordVisible,
      builder: (context, isPasswordVisible, _) {
        return TextFormField(
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password.(Any character for test)',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                _passwordVisible.value = !_passwordVisible.value;
              },
            ),
          ),
        );
      },
    );
  }
}
