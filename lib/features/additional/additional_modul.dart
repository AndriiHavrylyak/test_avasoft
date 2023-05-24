import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_for_avasoft/core/constants/routes.dart';
import 'package:test_for_avasoft/features/additional/pages/additional_page.dart';

class AdditionalModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.root, child: (_, args) => AdditionalPage(message: args.data)),
  ];
}
