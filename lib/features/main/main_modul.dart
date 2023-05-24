import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_for_avasoft/features/main/pages/main_page.dart';

import 'managers/main_bloc.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => MainBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const MainPage()),
  ];
}