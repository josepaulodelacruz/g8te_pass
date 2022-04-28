import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';

class GeolocateWidget extends StatelessWidget {
  const GeolocateWidget({Key? key}) : super(key: key);

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
                "2",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: COLOR_WHITE,
                  fontSize: SizeConfig.blockSizeVertical! * 3,
                ),
              ),
            ),
            title:
            const Text("Verify your location by allowing us to access your GPS location"),
            subtitle: const Text("Optional"),
            trailing: Icon(Icons.settings, size: SizeConfig.blockSizeVertical! * 5, color: COLOR_DARKER_BLUE),
          ),
        ),
      ],
    );
  }
}
