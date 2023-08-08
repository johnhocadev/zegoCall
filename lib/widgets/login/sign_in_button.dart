import 'package:flutter/material.dart';
import 'package:zego_call/core/routers/routers.dart';
import 'package:zego_call/core/style/text_styles.dart';
import 'package:zego_call/service/login_service.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required TextEditingController userIDTextCtrl,
    required this.context,
  }) : _userIDTextCtrl = userIDTextCtrl;

  final TextEditingController _userIDTextCtrl;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _userIDTextCtrl.text.isEmpty
          ? null
          : () async {
        login(
          userID: _userIDTextCtrl.text,
          userName: 'user_${_userIDTextCtrl.text}',
        ).then((value) {
          onUserLogin();

          Navigator.pushNamed(
            context,
            PageRouteNames.home,
          );
        });
      },
      child: const Text('Sign In', style: textStyle),
    );
  }
}
