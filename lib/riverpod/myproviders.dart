


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/AppState.dart';

final provider1 = Provider<AppState>((ref) {
  print("  Provider ${ref.hashCode} ");
  return AppState.count(10);
});

final stateprovider1 = StateProvider<AppState>((ref) {
  print("  StateProvider ${ref.hashCode} ");
  return AppState.count(-100);
});


TextStyle mytextStyle1=TextStyle(fontSize: 16);
TextStyle mytextStyle2=TextStyle(fontSize: 20);