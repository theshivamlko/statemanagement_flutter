import 'dart:async';

import 'package:get_it/get_it.dart';
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
    getIt.registerFactory<ClassE>(() => ClassE());

    print(
        "ClassE ${getIt<ClassE>()} ${getIt<ClassE>().hashCode} ${getIt<ClassE>().hashCode}");

    getIt.registerFactoryAsync<ClassF>(() => getIt<ClassE>().getClassF());
    ClassF classF = await getIt.getAsync<ClassF>();
    getIt.unregister<ClassF>();
    getIt.registerFactory<ClassF>(() => classF);

    print(
        "ClassF ${getIt<ClassF>()} ${getIt<ClassF>().hashCode} ${getIt<ClassF>().hashCode}");

    getIt.registerFactory(() => ClassG(classF));
    print(
        "ClassG ${getIt<ClassG>()} ${getIt<ClassG>().hashCode} ${getIt<ClassG>().hashCode}");

    getIt.registerFactory(() => ClassD(getIt<ClassE>()));
    print(
        "ClassD ${getIt<ClassD>()} ${getIt<ClassD>().hashCode} ${getIt<ClassD>().hashCode}");

    getIt.registerFactory<AbstractClassC>(
        () => ClassC(getIt<ClassD>(), getIt<ClassE>()));
    print(
        "AbstractClassF ${getIt<AbstractClassC>()} ${getIt<AbstractClassC>()} ${getIt<AbstractClassC>().hashCode} ${getIt<AbstractClassC>().hashCode}");

    getIt.registerSingleton<ClassB>(
        ClassB(getIt<AbstractClassC>(), getIt<ClassD>(), getIt<ClassE>()));
    print(
        "ClassB ${getIt<ClassB>()} ${getIt<ClassB>().hashCode} ${getIt<ClassB>().hashCode}");

    // BLOC
    getIt.registerFactory<ClassA>(() => ClassA(
          getIt<ClassB>(),
          getIt<AbstractClassC>(),
          getIt<ClassD>(),
          getIt<ClassE>(),
        ));
    getIt<ClassA>().classACounter++;
    print(
        "ClassA ${getIt<ClassA>().classACounter} ${getIt<ClassA>().hashCode} ${getIt<ClassA>().hashCode}");
    getIt<ClassA>().classACounter++;
    print(
        "ClassA ${getIt<ClassA>().classACounter} ${getIt<ClassA>().hashCode} ${getIt<ClassA>().hashCode}");
    getIt<ClassA>().classACounter++;
    print(
        "ClassA ${getIt<ClassA>().classACounter} ${getIt<ClassA>().hashCode} ${getIt<ClassA>().hashCode}");
    getIt<ClassA>().classACounter++;
    print(
        "ClassA1 ${getIt<ClassA>().classACounter} ${getIt<ClassA>().hashCode} ${getIt.get<ClassA>().hashCode}");
 print(
        "ClassA2 ${getIt<ClassA>().classACounter} ${getIt<ClassA>().hashCode} ${getIt.get<ClassA>().hashCode}");

    // Abstract

    // Use abstract implementation here

    print("ClassF 2");
  } catch (e) {
    print("initFeature1 $e");
  }
}
