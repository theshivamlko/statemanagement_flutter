import 'dart:async';

import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/CommonState.dart';
import 'package:statemanagement/StudentState.dart';

class ParentState implements CommonState {
  double salary = 1230.01;

  copy(double salary) {
    this.salary = salary;

  }
}
