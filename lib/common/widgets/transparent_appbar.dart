import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String? title;
  final Color iconColor;
  const TransparentAppBar({Key? key, this.title, this.iconColor = COLOR_DARK}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      elevation: 0,
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
