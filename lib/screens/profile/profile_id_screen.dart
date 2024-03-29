import 'package:flutter/material.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/widgets/transparent_appbar.dart';
import 'package:g8te_pass/screens/register/widgets/geolocate_widget.dart';
import 'package:g8te_pass/screens/register/widgets/photo_outside_house.dart';
import 'package:g8te_pass/screens/register/widgets/valid_id_widget.dart';

class ProfileIdScreen extends StatefulWidget {
  const ProfileIdScreen({Key? key}) : super(key: key);

  @override
  State<ProfileIdScreen> createState() => _ProfileIdScreenState();
}

class _ProfileIdScreenState extends State<ProfileIdScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Verification',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: COLOR_WHITE,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: COLOR_DARK.withOpacity(.9),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: COLOR_DARKEST_BLUE,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )
                      ),
                      child: ListTile(
                        title: Text(
                          "Saint Joseph Village 6",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: COLOR_WHITE,
                          ),
                        ),
                        trailing: const CircleAvatar(
                          child: FlutterLogo(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jose Paulo Dela Cruz",
                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                ),
                                _fieldLabel(
                                  field: "Contact Number",
                                  label: "+639123456789",
                                ),
                                _fieldLabel(
                                  field: "Address",
                                  label: "Blk 24 Lot 18 Phase 2 SJV 6 Butong Cabuyao Laguna.",
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              color: COLOR_WHITE,
                              child: const Center(
                                child: FlutterLogo(),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _fieldLabel(
                                  field: "Birthday",
                                  label: "October 21, 1995",
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Text(
                                "VERIFIED",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: COLOR_WHITE,
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  "Supporting Documents (optional)",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: FONT_BOLD,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "For quicker verification process you can add proof of your identity and/or your address.",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.blockSizeVertical! * 1.7,
                  ),
                ),
              ),
              const PhotoOutsideHouse(),
              const GeolocateWidget(),
              const ValidIdWidget(),

            ],
          ),
        ),
      )
    );
  }

  Widget _fieldLabel({String label = "Field Label", String field = ""}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field,
            style: TextStyle(
              fontFamily: FONT_BOLD,
              fontSize: SizeConfig.blockSizeVertical! * 1.7,
            ),
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: COLOR_WHITE, fontSize: SizeConfig.blockSizeVertical! * 2),
          ),
        ],
      ),
    );
  }
}
