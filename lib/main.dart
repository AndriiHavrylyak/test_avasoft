import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_for_avasoft/features/app/app_widget.dart';

import 'features/app/app_modul.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
