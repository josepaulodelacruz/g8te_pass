import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';

class ValidIdWidget extends StatelessWidget {
  const ValidIdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListTile(
            visualDensity: const VisualDensity(horizontal: -4),
            leading: CircleAvatar(
              radius: SizeConfig.blockSizeVertical! * 3.5,
              backgroundColor: COLOR_DARKER_BLUE,
              child: Text(
                "3",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: COLOR_WHITE,
                  fontSize: SizeConfig.blockSizeVertical! * 3,
                ),
              ),
            ),
            title:
            const Text("Upload any of your government valid ID"),
            subtitle: const Text("Optional"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          child: SizedBox(
            height: SizeConfig.screenHeight! * .3,
            child: Card(
              elevation: 2,
              child: Center(
                child: Icon(Icons.file_open,
                    color: COLOR_DARKER_BLUE,
                    size: SizeConfig.blockSizeVertical! * 10),
              ),
            ),
          ),
        )
      ],
    );
  }
}
