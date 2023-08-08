import 'package:flutter/material.dart';
import 'package:zego_call/core/utilities/util.dart';
import 'package:zego_call/widgets/login/logo.dart';
import 'package:zego_call/widgets/login/password_editor.dart';
import 'package:zego_call/widgets/login/sign_in_button.dart';
import 'package:zego_call/widgets/login/user_id_editor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _userIDTextCtrl = TextEditingController(text: 'user_id');
  final _passwordVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    getUniqueUserId().then((userID) async {
      setState(() {
        _userIDTextCtrl.text = userID;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 50),
              UserIdEditor(userIDTextCtrl: _userIDTextCtrl),
              PasswordEditor(passwordVisible: _passwordVisible),
              const SizedBox(height: 30),
              SignInButton(userIDTextCtrl: _userIDTextCtrl, context: context),
            ],
          ),
        ),
      ),
    );
  }
}




