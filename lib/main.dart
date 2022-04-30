import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g8te_pass/blocs/auth/auth_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_event.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/firebase_options.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/main-dev.dart';
import 'package:g8te_pass/router.dart' as on_router;
import 'package:firebase_core/firebase_core.dart';
import 'package:g8te_pass/services/auth-service.dart';
import 'package:g8te_pass/services/user-database-service.dart';

//Main initializer
void setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FirebaseApp mainApp;

  @override
  void initState() {
    _initializeMainFirebaseProject();
    super.initState();
  }

  Future<void> _initializeMainFirebaseProject () async {
    mainApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FirebaseBloc>(
            create: (context) => FirebaseBloc(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authService: AuthService(),
              databaseService: UserDatabaseService(
                mainApp: mainApp,
                selectedApp: Firebase.apps[0],
              ),
            ),
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

