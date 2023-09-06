import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/AppState.dart';

import 'riverpod/riverpod_launcher.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const InheritedWidgetApp());
  // Provider.debugCheckInvalidValueType = null;
 // runApp(const ProviderWidgetApp());
  runApp(ProviderScope(child:RiverpodWidgetApp()));

}




