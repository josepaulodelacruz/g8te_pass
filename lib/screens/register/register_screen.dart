import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g8te_pass/blocs/auth/auth_bloc.dart';
import 'package:g8te_pass/blocs/auth/auth_event.dart';
import 'package:g8te_pass/blocs/auth/auth_state.dart';
import 'package:g8te_pass/blocs/firebase/firebase_bloc.dart';
import 'package:g8te_pass/blocs/firebase/firebase_event.dart';
import 'package:g8te_pass/blocs/firebase/firebase_state.dart';
import 'package:g8te_pass/common/fixtures.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/utils.dart';
import 'package:g8te_pass/common/widgets/dropdown_widget.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:g8te_pass/common/widgets/transparent_appbar.dart';
import 'package:g8te_pass/common/contants.dart';
import 'package:g8te_pass/common/widgets/text_input_field.dart';
import 'package:g8te_pass/models/firebase_option.dart';
import 'package:g8te_pass/services/auth-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistraterScreen extends StatefulWidget {
  const RegistraterScreen({Key? key}) : super(key: key);

  @override
  State<RegistraterScreen> createState() => _RegistraterScreenState();
}

class _RegistraterScreenState extends State<RegistraterScreen> {
  late AuthService authService;
  Map<String, dynamic> values = <String, dynamic>{
    "email": "",
    "password": "",
    "confirmPassword": "",
    "role": "",
    "block": ""
    "lot" "",
    "streetAddress": "",
    "phase": "",
  };
  late FirebaseApp? _selectedApp;
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  Color backgroundColor = Colors.transparent;
  double elevation = 0;
  String appBarTitle = "";
  Color iconColor = COLOR_DARK;
  List<String> items = [];


  @override
  void initState() {
    items = options.map((option) {
      return option.projectName;
    }).toList();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() async {
    if (_scrollController.offset >=
        _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      elevation = 0;
      backgroundColor = COLOR_DARKER_BLUE;
      iconColor = COLOR_WHITE;
      appBarTitle = "Registration";
      setState(() {});
    }

    if (_scrollController.offset <=
        (SizeConfig.screenHeight! * .10) &&
        !_scrollController.position.outOfRange) {
      backgroundColor = Colors.transparent;
      iconColor = COLOR_DARK;
      elevation = 0;
      appBarTitle = "";
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<FirebaseBloc, FirebaseState>(
            listener: (context, state) {
              if (state.status == FirebaseStatus.loading) {
                modalHudLoad(context);
              } else if (state.status == FirebaseStatus.success) {
                Navigator.pop(context);
                _selectedApp = state.app;
                setState(() {});
              } else if (state.status == FirebaseStatus.waiting) {}
            },
          ),
          BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.loading) {
                  modalHudLoad(context);
                } else if (state.status == AuthStatus.login) {
                  Navigator.pop(context);
                  defaultDialog(
                      context,
                      icon: const Icon(
                          Icons.check_rounded, color: COLOR_SUCCESS),
                      title: "Congratulations!",
                      message: state.loginMessage,
                      onOk: () {
                        Navigator.pop(context);
                      }
                  );
                } else if (state.status == AuthStatus.failed) {
                  Navigator.pop(context);
                  defaultDialog(
                      context,
                      icon: const Icon(Icons.error, color: COLOR_DANGER),
                      title: "Failed Registration!",
                      message: state.loginMessage,
                      onOk: () {
                        Navigator.pop(context);
                      }
                  );
                } else if (state.status == AuthStatus.waiting) {}
              }
          )
        ],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: TransparentAppBar(
            title: appBarTitle,
            elevation: elevation,
            backgroundColor: backgroundColor,
            iconColor: iconColor,
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
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
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20),
                            child: Text(
                              "Registration",
                              textAlign: TextAlign.left,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2!,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
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
                        FirebaseOptionsModel selectedOption = options
                            .firstWhere((el) => el.projectName == val);
                        await Firebase.initializeApp(
                            name: selectedOption.projectName,
                            options: FirebaseOptions(
                              apiKey: selectedOption.apiKey,
                              appId: selectedOption.appId,
                              projectId: selectedOption.projectId,
                              messagingSenderId: selectedOption
                                  .messagingSenderId,
                            )
                        );
                        FirebaseApp selectedApp = Firebase.app(selectedOption
                            .projectName);
                        context.read<FirebaseBloc>().add(FirebaseSelectProject(
                            selectedApp: selectedApp));
                        Navigator.pop(context);
                      },
                      note: "Select which project?",
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Text(
                      "Details",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline3!
                          .copyWith(
                          fontSize: SizeConfig.blockSizeVertical! * 3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                      label: "First Name",
                    )
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                        label: "Middle Name(optional)",
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                        label: "Last Name",
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                        label: "Contact Number #",
                      )
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Address",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline3!
                          .copyWith(
                          fontSize: SizeConfig.blockSizeVertical! * 3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextInputField(
                            label: "Block",
                          ),
                        ),
                        const SizedBox(width: 10),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextInputField(
                            label: "Street Address (optional)",
                          ),
                        ),
                        const SizedBox(width: 10),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                      readOnly: true,
                      initialValue: "Brgy. Butong, Cabuyao City Laguna",
                      note: "Place of residence",
                      label: "",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),
                    child: TextInputField(
                      keyboardType: TextInputType.emailAddress,
                      label: "Email Address",
                      onSaved: (v) {
                        values['email'] = v;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),
                    child: TextInputField(
                      onSaved: (v) {
                        values['password'] = v;
                      },
                      keyboardType: TextInputType.text,
                      label: "Password",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),
                    child: TextInputField(
                      keyboardType: TextInputType.text,
                      label: "Confirm Password",
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: COLOR_DARKER_BLUE,
                      ),
                      onPressed: () {
                        _handleNext();
                      },
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
      ),
    );
  }

  void _handleNext() async {
    //saved form
    _formKey.currentState?.save();
    final bloc = context.read<AuthBloc>();
    ///initialize the firebase project
    bloc.authService =
        AuthService(auth: FirebaseAuth.instanceFor(app: _selectedApp!));
    context.read<AuthBloc>().add(
        AuthLoginEmail(email: values['email'], password: values['password']));
  }

}
