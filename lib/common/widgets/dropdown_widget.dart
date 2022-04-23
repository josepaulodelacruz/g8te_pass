import 'package:flutter/material.dart';
import 'package:g8te_pass/common/size_config.dart';

class DropdownWidget extends StatelessWidget {
   String note;
   Function onChanged;
   List<String> items;
  FormFieldValidator<String>? validator;


  DropdownWidget({
    Key? key,
    this.note = "",
    required this.onChanged,
    required this.items,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey[600],
          ),
        ),
        DropdownButtonFormField(
          validator: (v) => validator?.call("${v.toString()}"),
          onChanged: (val) {
            onChanged(val);
          },
          isExpanded: true,
          items: items.map((String option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          decoration: const InputDecoration(
          ),
        ),
      ],
    );
  }
}
