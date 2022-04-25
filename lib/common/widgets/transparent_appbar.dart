import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String? title;
  final Color iconColor;
  final double elevation;
  final Color backgroundColor;

  const TransparentAppBar({
    Key? key,
    this.title,
    this.iconColor = COLOR_DARKER_BLUE,
    this.elevation = 0,
    this.backgroundColor = Colors.transparent,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      elevation: elevation,
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: COLOR_WHITE,
          fontSize: 20,
        ),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
