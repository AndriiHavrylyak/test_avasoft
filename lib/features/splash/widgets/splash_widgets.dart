import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/routes.dart';
import '../../../core/constants/shared_name.dart';
import '../../../core/constants/titles.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  SplashWidgetState createState() => SplashWidgetState();
}

class SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    _checkAgeAndConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: CupertinoActivityIndicator(),
    );
  }

  Future<void> _checkAgeAndConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Modular.to.pushReplacementNamed(ModuleRoutes.additional,
          arguments: Titles.connectError);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? age = prefs.getInt(SharedName.age);
      if (age == null) {
        Modular.to.pushReplacementNamed(ModuleRoutes.main);
      } else if (age < 18) {
        Modular.to.pushReplacementNamed(ModuleRoutes.additional,
            arguments: Titles.sorryDeniedAccess);
      } else if (age >= 99) {
        Modular.to.pushReplacementNamed(ModuleRoutes.main);
      } else {
        Modular.to.pushReplacementNamed(ModuleRoutes.webView);
      }
    }
  }
}
