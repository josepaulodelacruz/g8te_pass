import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/utils.dart';
import 'package:g8te_pass/common/widgets/dropdown_widget.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:g8te_pass/common/widgets/transparent_appbar.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/widgets/text_input_field.dart';
import 'package:g8te_pass/models/firebase_option.dart';

class RegistraterScreen extends StatefulWidget {
  const RegistraterScreen({Key? key}) : super(key: key);

  @override
  State<RegistraterScreen> createState() => _RegistraterScreenState();
}

class _RegistraterScreenState extends State<RegistraterScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  List<String> items = [];
  List<FirebaseOptionsModel> options = [
    const FirebaseOptionsModel(
      associationName: "G8te Pass",
      appId: "1:247894978562:android:17077c2bdd17af82dcb71b",
      apiKey: "AIzaSyCuKwuPXneN8LrWytYDj7Z0IKU7ww0G0_Y",
      projectId: "g8te-pass",
      messagingSenderId: "247894978562",
    ),
    const FirebaseOptionsModel(
      associationName: "Saint Joseph Village 6",
      appId: "1:188291409218:android:e7c5cf39f7ab1d9c0f94db",
      apiKey: "AIzaSyAjTP7RBzX8Lri7xatRWzJmxJGytjnfEuU",
      projectId: "saint-joseph-6-association",
      messagingSenderId: "188291409218",
    ),
  ];

  @override
  void initState () {
    items = options.map((option) {
      return option.associationName;
    }).toList();
    print(items);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const TransparentAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "bg",
                  child: GradientBackground(
                    height: .20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Text(
                            "Registration",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline2!,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: TextInputField(
                    note: "Please select first what type of user you are?",
                    label: "Select Role",
                    hintText: "Homeowner",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownWidget(
                    items: items,
                    onChanged: (val) async {
                      modalHudLoad(context);
                      FirebaseOptionsModel selectedOption = options.firstWhere((el) => el.associationName == val);
                      print(selectedOption.associationName);
                      await Firebase.initializeApp(
                        name: selectedOption.associationName,
                        options: FirebaseOptions(
                          apiKey: selectedOption.apiKey,
                          appId: selectedOption.appId,
                          projectId: selectedOption.projectId,
                          messagingSenderId: selectedOption.messagingSenderId,
                        )
                      );
                      Navigator.pop(context);
                    },
                    note: "Select which homeowner association you are a part of?",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Address",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: SizeConfig.blockSizeVertical! * 3),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                      Flexible(
                        flex: 1,
                        child: TextInputField(
                          label: "Block",
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextInputField(
                          label: "Lot",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                      Flexible(
                        flex: 1,
                        child: TextInputField(
                          label: "Street Address (optional)",
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextInputField(
                          label: "Phase",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    readOnly: true,
                    initialValue: "Brgy. Butong, Cabuyao City Laguna",
                    note: "Place of residence",
                    label: "",
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: COLOR_DARKER_BLUE,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Confirm",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
