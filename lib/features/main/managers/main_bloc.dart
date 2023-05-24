import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/config/notifications.dart';
import '../../../core/constants/routes.dart';
import '../../../core/constants/shared_name.dart';
import '../../../core/constants/titles.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<AgeSubmitted>((event, emit) async {
      emit(state.copyWith(age: event.age));
    });

    on<Submitted>((event, emit) async {
      if (state.age! < 18) {
        saveAgeAndRedirect(
            state.age!, ModuleRoutes.additional, Titles.sorryDeniedAccess);
      } else if (state.age! > 99) {
        emit(state.copyWith(isProgress: true));
        showErrorToast(Titles.goodAttemptPleasEnterRealAge);
      } else {
        saveAgeAndRedirect(state.age!, ModuleRoutes.webView);
      }
    });
  }

  Future saveAgeAndRedirect(int age, String route, [String? argument]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedName.age, age);
    Modular.to.pushReplacementNamed(route, arguments: argument);
  }
}
