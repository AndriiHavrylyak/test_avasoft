import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_for_avasoft/core/constants/routes.dart';

import '../../../core/constants/titles.dart';
import '../widgets/additional_widget.dart';

class AdditionalPage extends StatelessWidget {
  final String message;

  const AdditionalPage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional'),
        leading: message == Titles.connectError
            ? Container()
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Modular.to.pushReplacementNamed(ModuleRoutes.main);
                },
              ),
      ),
      body: AdditionalWidget(
        message: message,
      ),
    );
  }
}
