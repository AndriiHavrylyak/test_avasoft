import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_for_avasoft/features/webview/pages/webviev_page.dart';
import 'managers/webview_bloc.dart';


class WebViewModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => WebViewBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => WebViewPage()),
  ];
}
