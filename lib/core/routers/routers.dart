// Project imports:

import 'package:flutter/material.dart';
import 'package:zego_call/pages/home/home_page.dart';
import 'package:zego_call/pages/login/login_page.dart';

class PageRouteNames {
  static const String login = '/login';
  static const String home = '/home_page';
}
Map<String, WidgetBuilder> routes = {
  PageRouteNames.login: (context) => const LoginPage(),
  PageRouteNames.home: (context) => const HomePage(),
};