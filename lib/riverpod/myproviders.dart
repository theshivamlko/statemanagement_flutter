


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/riverpod/Clock.dart';

final provider1 = Provider<AppState>((ref) {
  print("  Provider ${ref.hashCode} ");
  return AppState.count(10);
});

final stateprovider1 = StateProvider<AppState>((ref) {
  print("  StateProvider ${ref.hashCode} ");
  return AppState.count(-100);
});

final stateprovider2 = StateProvider<AppState>((ref) {
  print("  StateProvider ${ref.hashCode} ");
  return AppState.count(00);
});

final clockProvider = StateNotifierProvider.autoDispose<Clock, DateTime>((ref) {
  print("  StateNotifierProvider ${ref.hashCode} ");
  return Clock();
});



final futureProvider = FutureProvider.autoDispose<AppState>((ref) {
  return Future<AppState>.delayed(const Duration(seconds: 5),(){
    return AppState.count(200);
  });
});



TextStyle mytextStyle1=TextStyle(fontSize: 16);
TextStyle mytextStyle2=TextStyle(fontSize: 20);