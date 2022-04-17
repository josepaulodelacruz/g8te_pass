import 'package:flutter/material.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/widgets/outline_button_icon.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Hero(
            tag: "launch_logo",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical! * 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: COLOR_DARK),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Welcome!\n",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        TextSpan(
                          text: "Be active in your community.\n",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: FlutterLogo(
                    size: SizeConfig.blockSizeHorizontal! * 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: COLOR_DARK),
                      children: <TextSpan>[
                        TextSpan(
                          text: "G8te Pass\n",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        TextSpan(
                          text: "Help us make your community safe!.",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      OutlineButtonWidgetIcon(
                        icon: const Icon(Icons.arrow_forward_outlined, color: COLOR_WHITE),
                        text: "Get Started",
                        onPressed: () {
                          Navigator.pushNamed(context, launchLogRegScreen);
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
