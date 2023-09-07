import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/CommonState.dart';

class AppState extends Equatable implements CommonState {
  int counter = 0;
  int counter2 = 0;

  AppState.count(this.counter);

  AppState();

  AppState copy({int? counter}) {
    AppState appState = AppState();
    appState.counter = counter!;
    return appState;
  }

  AppState copy2({int? counter2}) {
    AppState appState = AppState();
    appState.counter2 = counter2!;
    return appState;
  }

  increment() {
    counter++;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "AppState $this $counter";
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter, counter2];

  Map<String, dynamic> toMap() {
    return {"counter": counter};
  }

  String toJson() {
    return json.encode({"counter": counter});
  }

  factory AppState.fromJson(String source) {
    return AppState.count(json.decode(source)['counter']);
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState.count(map['counter']);
  }
}
