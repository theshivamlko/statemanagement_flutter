import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 import 'package:statemanagement/providers/provider_launcher.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const InheritedWidgetApp());
  Provider.debugCheckInvalidValueType = null;
 runApp(const ProviderWidgetApp());
  // runApp(ProviderScope(child:   RiverpodWidgetApp()));

}




