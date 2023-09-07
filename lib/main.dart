import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:statemanagement/AppState.dart';

import 'bloc/MyBlocObserver.dart';
import 'bloc/bloc_launcher.dart';
import 'riverpod/riverpod_launcher.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer=MyBlocObserver();

  // runApp(const InheritedWidgetApp());
  // Provider.debugCheckInvalidValueType = null;
 // runApp(const ProviderWidgetApp());
 //  runApp(ProviderScope(child:RiverpodWidgetApp()));
  runApp(BlocWidgetApp());

}




