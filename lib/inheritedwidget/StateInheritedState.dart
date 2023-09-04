import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class StateInheritedState extends InheritedWidget {
  final AppState appState;

  const StateInheritedState({super.key,

    required this.appState,
    required Widget child,
  }) : super(child: child);

  static AppState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StateInheritedState>()
        ?.appState;
  }

  @override
  bool updateShouldNotify(StateInheritedState oldWidget) {
   return oldWidget.appState != appState;

  }
}
