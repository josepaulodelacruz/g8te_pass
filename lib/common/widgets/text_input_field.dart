import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';

class TextInputField extends StatelessWidget {
  final String note;
  final String label;
  final Color labelColor;
  final TextEditingController? controller;
  final String hintText;
  final bool readOnly;
  final String initialValue;
  final TextInputType keyboardType;

  const TextInputField({
    Key? key,
    this.note = "",
    this.label = "",
    this.labelColor = COLOR_DARK,
    this.controller,
    this.hintText = "",
    this.readOnly = false,
    this.initialValue = "",
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          note,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey[600],
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          initialValue: initialValue,
          style: const TextStyle(
            fontFamily: FONT,
            color: COLOR_DARK,
          ),
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context).textTheme.bodyText1!,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
