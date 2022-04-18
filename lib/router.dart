import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/screens/export_screens.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case launchScreen:
        return CupertinoPageRoute(builder: (_) => const LaunchScreen());
      case launchLogRegScreen:
        return MaterialPageRoute(builder: (_) => const LaunchLogRegScreen());
      case loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return CupertinoPageRoute(builder: (_) => const RegistraterScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
