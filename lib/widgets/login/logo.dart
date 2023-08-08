import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: 'ZE',
          style: TextStyle(color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
              text: 'GO',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(text: 'CLOUD'),
          ],
        ),
      ),
    );
  }
}