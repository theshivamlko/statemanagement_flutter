import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:statemanagement/riverpod/Logger.dart';
import 'package:statemanagement/riverpod/myproviders.dart';
import 'package:statemanagement/riverpod/riverpod_launcher.dart';

import 'AppState.dart';
import 'bloc/MyBlocObserver.dart';
import 'bloc/bloc_launcher.dart';
import 'getit/getit_launcher.dart';
import 'getit/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = MyBlocObserver();
  print("MAIN1");
  await init();
  print("MAIN2");

  // runApp(const InheritedWidgetApp());
  // Provider.debugCheckInvalidValueType = null;
  // runApp(const ProviderWidgetApp());
/*  runApp(ProviderScope(
      overrides: [provider1.overrideWith((ref) => AppState.count(5))],
      observers: [Logger()],
      child: RiverpodWidgetApp()));*/
  // runApp(BlocWidgetApp());
  runApp(GetItWidgetApp());
}
