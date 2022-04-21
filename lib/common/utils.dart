import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/widgets/default_dialog.dart';

void modalHudLoad(context,
    {String load = "Loading...",
      Color color = Colors.white,
      Color indicatorColor = COLOR_DARKEST_BLUE}) async {
  showDialog(
    barrierColor: Colors.black.withOpacity(0.4),
    barrierDismissible: false,
    context: context,
    builder: (_) => WillPopScope(
      onWillPop: () => Future.value(false),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text(
            load,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
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