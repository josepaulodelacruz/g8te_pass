import 'package:flutter/material.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/main.dart';

void main () async {
  FlavorConfig(
    flavor: Flavor.test,
    values: FlavorValues(
      appName: "G8te Pass Dev",
      baseUrl: "",
    ),
  );
  setupApp();
}