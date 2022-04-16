import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, launchScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GradientBackground(
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
    );
  }
}
