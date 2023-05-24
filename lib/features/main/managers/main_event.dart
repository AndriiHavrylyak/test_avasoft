part of 'main_bloc.dart';

abstract class MainEvent {}

class AgeSubmitted extends MainEvent {
  final int age;

  AgeSubmitted(this.age);

  List<Object?> get props => [age];
}

class Submitted extends MainEvent {}
