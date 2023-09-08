import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';
import 'package:statemanagement/getit/AbstractClassC.dart';
import 'package:statemanagement/getit/ClassB.dart';
import 'package:statemanagement/getit/ClassC.dart';
import 'package:statemanagement/getit/ClassE.dart';
import 'package:statemanagement/getit/ClassF.dart';

import 'ClassA.dart';
import 'ClassD.dart';
import 'ClassG.dart';

Future init() async {
  await initFeature();
}

Future initFeature() async {
  // Register all here to be used later weather singleton or new instances
  try {
    GetIt getIt = GetIt.instance;
    print("getIt1 ${getIt.hashCode}");

    // registerFactory
    getIt.registerFactory<ClassE>(() => ClassE());

    // registerFactory async function
    getIt.registerFactoryAsync<ClassF>(() => getIt<ClassE>().getClassF());
    ClassF classF = await getIt.getAsync<ClassF>();
    getIt.unregister<ClassF>();

    getIt.registerFactory<ClassF>(() => classF);

    getIt.registerFactory(() => ClassG(classF));

    getIt.registerFactory(() => ClassD(getIt<ClassE>()));

    // Abstract class
    getIt.registerFactory<AbstractClassC>(
        () => ClassC(getIt<ClassD>(), getIt<ClassE>()));

    // registerSingleton
    getIt.registerSingleton<ClassB>(
        ClassB(getIt<AbstractClassC>(), getIt<ClassD>(), getIt<ClassE>()));

    // BLOC
    getIt.registerFactory<ClassA>(() => ClassA(
          getIt<ClassB>(),
          getIt<AbstractClassC>(),
          getIt<ClassD>(),
          getIt<ClassE>(),
        ));

    // registerFactoryParam with Name
    getIt.registerFactoryParam<AppState, int, void>((param1, _) {
      return AppState.count(param1);
    }, instanceName: 'AppState');

    // registerSingletonAsync
    getIt.registerSingletonAsync<SharedPreferences>(
        () => SharedPreferences.getInstance());

    // Only async singleton dependsOn allowed
    getIt.registerSingletonWithDependencies<AppState>(
      () => AppState.count(300),
      dependsOn: [SharedPreferences],
    );
    print("ClassF 2");
  } catch (e) {
    print("initFeature1 $e");
  }
}
