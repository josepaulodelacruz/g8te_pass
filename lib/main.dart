import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/router.dart' as on_router;

//Main initializer
void setupApp() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: createTheme(context),
      title: FlavorConfig.instance.values.appName,
      initialRoute: splashScreen,
      onGenerateRoute: on_router.Router.generateRoute,
    );
  }
}

