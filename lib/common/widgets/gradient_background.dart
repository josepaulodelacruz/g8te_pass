import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';

class GradientBackground extends StatelessWidget {
  final double height;
  final Widget child;

  const GradientBackground({key, required this.child, this.height = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 1],
            colors: [COLOR_LIGHT_BLUE, COLOR_DARK_BLUE],
          )),
      child: child,
    );
  }
}