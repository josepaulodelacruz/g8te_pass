import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';

class OutlineButtonWidgetIcon extends StatelessWidget {
  final String text;
  final Function onPressed;
  final EdgeInsets? padding;
  final Icon icon;
  const OutlineButtonWidgetIcon({
    key,
    required this.text,
    required this.onPressed,
    this.padding,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 20,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(SizeConfig.blockSizeVertical! * 25, 50),
          side: const BorderSide(
            color: COLOR_WHITE, width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.blockSizeHorizontal! * 10,
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              text,
              style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.3,
                color: COLOR_WHITE,
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}