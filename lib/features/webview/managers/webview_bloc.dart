import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'webview_event.dart';

part 'webview_state.dart';

class WebViewBloc extends Bloc<WebViewEvent, WebViewState> {
  WebViewBloc() : super(const WebViewState()) {
    on<StartLoading>((event, emit) async {
      emit(state.copyWith(isProcess: true));
    });
    on<FinishLoading>((event, emit) async {
      emit(state.copyWith(isProcess : false));
    });
  }


}


