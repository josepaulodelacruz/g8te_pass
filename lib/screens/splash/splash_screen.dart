import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g8te_pass/blocs/auth/auth_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_event.dart';
import 'package:g8te_pass/blocs/firebase/firebase_state.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g8te_pass/services/database-service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      List<FirebaseApp> apps = Firebase.apps;
      context.read<FirebaseBloc>().add(FirebaseMainProject(defaultApp: apps.first));
      Navigator.pushNamed(context, launchScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GradientBackground(
        child: BlocListener<FirebaseBloc, FirebaseState>(
          listener: (context, state) {
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FlutterLogo(
                size: 150,
              ),
              const SizedBox(height: 20),
              Text(
                "G8te Pass",
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: SizeConfig.safeBlockHorizontal! * 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
