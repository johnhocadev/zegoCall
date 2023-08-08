import 'package:flutter/material.dart';

class UserIdEditor extends StatelessWidget {
  const UserIdEditor({
    super.key,
    required TextEditingController userIDTextCtrl,
  }) : _userIDTextCtrl = userIDTextCtrl;

  final TextEditingController _userIDTextCtrl;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _userIDTextCtrl,
      decoration: const InputDecoration(
        labelText: 'Phone Num.(User for user id)',
      ),
    );
  }
}
