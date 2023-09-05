import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/CommonState.dart';
import 'package:statemanagement/StudentState.dart';

class StudentStateInherited extends InheritedWidget {
  final StudentState state;

  const StudentStateInherited({super.key,

    required this.state,
    required Widget child,
  }) : super(child: child);

  static StudentState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StudentStateInherited>()
        ?.state;
  }

  @override
  bool updateShouldNotify(StudentStateInherited oldWidget) {
    print("StudentStateInherited updateShouldNotify ${oldWidget.state != state} ${oldWidget.state.hashCode} ${state.hashCode}");

   return oldWidget.state != state;

  }
}
