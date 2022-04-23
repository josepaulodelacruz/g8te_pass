import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';

class TextInputField extends StatelessWidget {
  String note;
  String label;
  Color labelColor;
  TextEditingController? controller;
  String hintText;
  bool readOnly;
  String initialValue;
  TextInputType keyboardType;
  Function? onChanged;
  FormFieldSetter<String>? onSaved;
  FormFieldValidator<String>? validator;
  bool visible;

    TextInputField({
    Key? key,
    this.note = "",
    this.label = "",
    this.labelColor = COLOR_DARK,
    this.controller,
    this.hintText = "",
    this.readOnly = false,
    this.initialValue = "",
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.visible = false,
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
          obscureText: visible,
          validator: (v) => validator?.call(v),
          onSaved: (v) {
            if (onSaved != null) {
              onSaved?.call(v);
            }
          },
          // onChanged: (v) {
            // if(onChanged != null) {
            //   onChanged?.call(v);
            // }
          // },
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
