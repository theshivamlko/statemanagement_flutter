import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:statemanagement/bloc/CounterCubit.dart';
import 'package:statemanagement/getit/AbstractClassF.dart';
import 'package:statemanagement/getit/ClassB.dart';
import 'package:statemanagement/getit/ClassC.dart';
import 'package:statemanagement/getit/ClassE.dart';
import 'package:statemanagement/getit/ClassF.dart';

import 'ClassA.dart';
import 'ClassD.dart';
import 'ClassG.dart';

GetIt getIt = GetIt.instance;

void init() {
  initFeature();
}

initFeature() {
  // BLOC
  getIt.registerFactory(() => ClassA(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));

  // Abstract
  getIt.registerFactory<AbstractClassF>(() => ClassC(getIt(), getIt()));

  // Use abstract implementation here
  getIt.registerFactory(() => ClassB(
        getIt(),
        getIt(),
        getIt(),
      ));

  getIt.registerFactory(() => ClassC(
        getIt(),
        getIt<ClassE>(),
      ));

  getIt.registerFactory(() => ClassD(
        getIt<ClassE>(),
      ));

  getIt.registerSingleton(ClassE());

  print("ClassF");
  getIt.registerFactoryAsync<ClassF>(() async => getIt.get<ClassE>().getClassF());

  Timer(Duration(seconds: 4), () {
    print("ClassF Timer ${getIt.get<ClassF>()}");
  });

//  getIt.registerFactory<ClassG>(() => ClassG(getIt.get<ClassF>()));
}
