
import 'package:flutter/material.dart';
import 'package:statemanagement/CommonState.dart';


class AppState implements CommonState {
  Color? background;
  int counter = 0;
  copy(int counter, Color background) {
    this.counter = counter;
    this.background = background;
  }
  AppState.count(this.counter);

  @override
  void dispose() {
    // TODO: implement dispose
  }


}
