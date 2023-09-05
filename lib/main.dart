import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/providers/MyProviderPage1.dart';
import 'package:statemanagement/providers/provider_launcher.dart';

import 'inheritedwidget/launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const InheritedWidgetApp());
 runApp(const ProviderWidgetApp());
}




