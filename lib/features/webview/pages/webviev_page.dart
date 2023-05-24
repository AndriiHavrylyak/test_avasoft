import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_avasoft/features/webview/managers/webview_bloc.dart';
import '../widgets/webview_widget.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebViewBloc(),
      child: const Scaffold(
        body: WebViewWidget(),
      ),
    );
  }
}
