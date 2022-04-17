import 'package:flutter/material.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:g8te_pass/common/widgets/gradient_background.dart';
import 'package:g8te_pass/common/widgets/transparent_appbar.dart';
import 'package:g8te_pass/common/contants.dart';

class RegistraterScreen extends StatefulWidget {
  const RegistraterScreen({Key? key}) : super(key: key);

  @override
  State<RegistraterScreen> createState() => _RegistraterScreenState();
}

class _RegistraterScreenState extends State<RegistraterScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      body: SingleChildScrollView(
        child: Column(
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
            ListTile(title: Text('Text')),
          ],
        ),
      )
    );
  }
}
