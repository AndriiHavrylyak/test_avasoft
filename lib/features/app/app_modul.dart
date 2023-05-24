import 'package:flutter_modular/flutter_modular.dart';

import '../../core/constants/routes.dart';
import '../additional/additional_modul.dart';
import '../main/main_modul.dart';
import '../splash/splash_modul.dart';
import '../webview/webview_modul.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.root, module: SplashModule()),
    ModuleRoute(ModuleRoutes.main, module: MainModule()),
    ModuleRoute(ModuleRoutes.additional, module: AdditionalModule()),
    ModuleRoute(ModuleRoutes.webView, module: WebViewModule()),
  ];
}
