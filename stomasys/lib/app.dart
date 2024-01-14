import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/routes/index.dart';
import 'package:stomasys/splash_screen.dart';

import 'helpers/route_helpers.dart';

class App extends ConsumerStatefulWidget {
  App({Key? key}) : super(key: key);
  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter',
      navigatorObservers: [RouteHelper.routeObserver],
      initialRoute: '/',
      onGenerateRoute: routes,
      home: SplashScreen(),
    );
  }
}