import 'package:flutter/material.dart';

import '../auth/login_screen.dart';
import '../splash_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/auth':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
