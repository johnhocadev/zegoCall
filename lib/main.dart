import 'package:zego_call/set_up.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() async {
  final navigatorKey = await setup();
  runApp(MyApp(navigatorKey: navigatorKey));
}



