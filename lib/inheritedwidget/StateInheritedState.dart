import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class StateInheritedState extends InheritedWidget {
  final AppState appState;

  StateInheritedState({required this.appState, required super.child});


  static StateInheritedState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateInheritedState>();
  }

  @override
  bool updateShouldNotify(StateInheritedState oldWidget) {
    print(
        "updateShouldNotify ${oldWidget.appState != appState} ${oldWidget.appState.hashCode} ${appState.hashCode}");

    return oldWidget.appState != appState;
  }
}
