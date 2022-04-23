import 'package:flutter/material.dart';
import 'package:g8te_pass/flavor_config.dart';
import 'package:g8te_pass/main.dart';


void main () async {
  FlavorConfig(
    flavor: Flavor.prod,
    values: FlavorValues(
      baseUrl: "",
      appName: "G8TE Pass",
      namespace: "",
    ),
  );
  setupApp();
}