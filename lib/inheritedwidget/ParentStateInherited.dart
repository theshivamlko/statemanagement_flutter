import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/CommonState.dart';
import 'package:statemanagement/ParentState.dart';

class ParentStateInherited extends InheritedWidget {
  final ParentState state;

  const ParentStateInherited({
    super.key,
    required this.state,
    required Widget child,
  }) : super(child: child);

  static ParentState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ParentStateInherited>()
        ?.state;
  }

  @override
  bool updateShouldNotify(ParentStateInherited oldWidget) {
    print("ParentStateInherited updateShouldNotify ${oldWidget.state != state} ${oldWidget.state.hashCode} ${state.hashCode}");

    return oldWidget.state != state;
  }
}
