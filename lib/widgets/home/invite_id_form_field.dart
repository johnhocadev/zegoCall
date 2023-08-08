import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InviteIDFormField extends StatelessWidget {
  final TextEditingController textCtrl;
  final List<TextInputFormatter>? formatters;
  final String hintText;
  final String labelText;

  const InviteIDFormField({
    required this.textCtrl,
    this.formatters,
    this.hintText = '',
    this.labelText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 12.0);
    return Expanded(
      flex: 100,
      child: SizedBox(
        height: 30,
        child: TextFormField(
          style: textStyle,
          controller: textCtrl,
          inputFormatters: formatters,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: textStyle,
            labelText: labelText,
            labelStyle: textStyle,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
