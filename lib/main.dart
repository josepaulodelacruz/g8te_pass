import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_bloc.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/firebase_options.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/router.dart' as on_router;
import 'package:firebase_core/firebase_core.dart';

//Main initializer
void setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // name: "DEFAULT",
    // options: const FirebaseOptions(
    //   appId: "1:247894978562:android:17077c2bdd17af82dcb71b",
    //   apiKey: "AIzaSyCuKwuPXneN8LrWytYDj7Z0IKU7ww0G0_Y",
    //   projectId: "g8te-pass",
    //   messagingSenderId: "247894978562",
    // )
  );
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<FirebaseBloc>(
            create: (context) => FirebaseBloc(),
          ),
        ],
        child: MaterialApp(
          theme: createTheme(context),
          title: FlavorConfig.instance.values.appName,
          initialRoute: splashScreen,
          onGenerateRoute: on_router.Router.generateRoute,
        )
    );
  }
}

