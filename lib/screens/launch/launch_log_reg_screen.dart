import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/string_routes.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:g8te_pass/common/widgets/outline_button_icon.dart';
import 'package:g8te_pass/common/widgets/transparent_appbar.dart';
import 'package:g8te_pass/common/size_config.dart';

class LaunchLogRegScreen extends StatelessWidget {
  const LaunchLogRegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      body: Stack(
        children: [
          const Hero(
            tag: 'bg',
            child: GradientBackground(
              child: SizedBox() //empty container,
            ),
          ),
          Hero(
            tag: 'launch_logo',
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
                    size: SizeConfig.blockSizeVertical! * 30,
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
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    OutlineButtonWidgetIcon(
                      icon: const Icon(Icons.login,
                          color: COLOR_WHITE),
                      text: "LOGIN",
                      onPressed: () {
                        Navigator.pushNamed(context, loginScreen);
                      },
                    ),
                    OutlineButtonWidgetIcon(
                      icon: const Icon(Icons.person_add,
                          color: COLOR_WHITE),
                      text: "REGISTER",
                      onPressed: () {
                        Navigator.pushNamed(context, registerScreen);
                      },
                    ),
                    const SizedBox(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
