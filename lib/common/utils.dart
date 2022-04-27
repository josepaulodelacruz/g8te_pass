import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/widgets/default_dialog.dart';

void modalHudLoad(context,
    {String load = "Please wait...",
      Color color = Colors.white,
      Color indicatorColor = COLOR_DARKEST_BLUE}) async {
  showDialog(
    barrierColor: Colors.black.withOpacity(0.4),
    barrierDismissible: false,
    context: context,
    builder: (_) => WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircularProgressIndicator(color: COLOR_DARKER_BLUE, strokeWidth: 4),
            SizedBox(width: SizeConfig.blockSizeHorizontal! * 4),
            Text(
              load,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void defaultDialog(context, {
  required String title,
  required String message,
  final Function? onOk,
  final Icon? icon,
}) {
  showDialog(
    context: context,
    builder: (_) => DefaultDialog(
      icon: icon!,
      title: title,
      message: message,
      onOk: () {
        onOk?.call();
      },
    )
  );
}