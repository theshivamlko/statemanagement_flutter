import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/CommonState.dart';

class AppStateInherited extends InheritedWidget {
  final AppState state;

  const AppStateInherited({super.key,

    required this.state,
    required Widget child,
  }) : super(child: child);

  static AppState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppStateInherited>()
        ?.state;
  }

  @override
  bool updateShouldNotify(AppStateInherited oldWidget) {
    print("AppStateInherited updateShouldNotify ${oldWidget.state != state} ${oldWidget.state.hashCode} ${state.hashCode}");
  // return oldWidget.state != state;
   return false;

  }
}
