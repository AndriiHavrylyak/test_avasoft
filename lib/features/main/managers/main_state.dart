part of 'main_bloc.dart';

class MainState extends Equatable {
  final bool isProgress;
  final int? age;

  const MainState({
    this.isProgress = false,
    this.age,
  });

  MainState copyWith({
    bool? isProgress,
    int? age,
  }) {
    return MainState(
      isProgress: isProgress ?? this.isProgress,
      age: age ?? this.age,
    );
  }

  @override
  List<Object?> get props => [
        isProgress,
        age,
      ];
}
