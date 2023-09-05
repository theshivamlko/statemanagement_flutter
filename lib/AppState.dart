import 'dart:async';

import 'package:flutter/material.dart';
import 'package:statemanagement/CommonState.dart';

@immutable
class AppState implements CommonState {
  Color? background;
  int counter = 0;
  copy(int counter, Color background) {
    this.counter = counter;
    this.background = background;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
