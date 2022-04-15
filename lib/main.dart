import 'package:flutter/material.dart';
import 'package:g8te_pass/flavor_config.dart';

//Main function
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(FlavorConfig.instance.values.appName),
        ),
        body: const Center(
          child: Text("Hello world"),
        ),
      )
    );
  }
}

