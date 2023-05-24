import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../managers/main_bloc.dart';
import '../widgets/main_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: const MainWidget(),
    );
  }
}
