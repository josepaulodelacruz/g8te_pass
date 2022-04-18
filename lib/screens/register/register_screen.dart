import 'package:flutter/material.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:g8te_pass/common/widgets/transparent_appbar.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/screens/register/widgets/text_input_field.dart';

class RegistraterScreen extends StatefulWidget {
  const RegistraterScreen({Key? key}) : super(key: key);

  @override
  State<RegistraterScreen> createState() => _RegistraterScreenState();
}

class _RegistraterScreenState extends State<RegistraterScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();

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
                    )
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextInputField(
                    note: "Select which homeowner association you are a part of?",
                    label: "Association",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Address",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: SizeConfig.blockSizeVertical! * 3
                    ),
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
                  )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
