import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function? onOk;
  final Icon? icon;


  const DefaultDialog({
    Key? key,
    this.title = "",
    this.message = "",
    this.onOk,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontFamily: FONT_BOLD,
              color: COLOR_DARK,
              fontSize: SizeConfig.blockSizeVertical! * 2.3,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Text(
              message,
              style: TextStyle(
                fontFamily: FONT,
                color: COLOR_DARK,
                fontSize: SizeConfig.blockSizeVertical! * 2,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            onOk?.call();
          },
          child: const Text(
            "OK",
            style: TextStyle(
              fontFamily: FONT,
              color: COLOR_DARK,
            ),
          ),
        )
      ],
    );
  }
}
