

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/AppState.dart';

final provider1 = Provider<AppState>((ref) {
  print("  provider1 ${ref.hashCode} ");
  return AppState.count(10);
});

final provider2 = Provider<AppState>((ref) {
  print("  provider2 ${ref.hashCode} ");
  return AppState.count(-100);
});
