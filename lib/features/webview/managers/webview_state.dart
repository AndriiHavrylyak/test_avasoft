part of 'webview_bloc.dart';

class WebViewState extends Equatable {
  final bool? isProcess;

  const WebViewState({
    this.isProcess,
  });

  WebViewState copyWith({
    bool? isProcess,
  }) {
    return WebViewState(
      isProcess: isProcess ?? this.isProcess,
    );
  }


  @override
  List<Object?> get props => [
        isProcess,
      ];
}
