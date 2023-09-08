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
  try {
    GetIt getIt = GetIt.instance;
    getIt.registerFactory<ClassE>(() => ClassE());

    print(
        "ClassE ${getIt.get<ClassE>()} ${getIt.get<ClassE>().hashCode} ${getIt.get<ClassE>().hashCode}");
    getIt.registerFactoryAsync<ClassF>(() => getIt.get<ClassE>().getClassF());
    ClassF classF = await getIt.getAsync<ClassF>();
    getIt.unregister<ClassF>();
    getIt.registerFactory<ClassF>(() => classF);
    print(
        "ClassF ${getIt.get<ClassF>()} ${getIt.get<ClassF>().hashCode} ${getIt.get<ClassF>().hashCode}");

    getIt.registerFactory(() => ClassG(classF));
    print(
        "ClassG ${getIt.get<ClassG>()} ${getIt.get<ClassG>().hashCode} ${getIt.get<ClassG>().hashCode}");

    getIt.registerFactory(() => ClassD(getIt.get<ClassE>()));
    print(
        "ClassD ${getIt.get<ClassD>()} ${getIt.get<ClassD>().hashCode} ${getIt.get<ClassD>().hashCode}");

    getIt.registerFactory<AbstractClassC>(
        () => ClassC(getIt.get<ClassD>(), getIt.get<ClassE>()));
    print(
        "AbstractClassF ${getIt.get<AbstractClassC>()} ${getIt.get<AbstractClassC>()} ${getIt.get<AbstractClassC>().hashCode} ${getIt.get<AbstractClassC>().hashCode}");

    getIt.registerSingleton<ClassB>(ClassB(
        getIt.get<AbstractClassC>(), getIt.get<ClassD>(), getIt.get<ClassE>()));
    print(
        "ClassB ${getIt.get<ClassB>()} ${getIt.get<ClassB>().hashCode} ${getIt.get<ClassB>().hashCode}");

    // BLOC
    getIt.registerFactory<ClassA>(() => ClassA(
          getIt.get<ClassB>(),
          getIt.get<AbstractClassC>(),
          getIt.get<ClassD>(),
          getIt.get<ClassE>(),
        ));
    print(
        "ClassA ${getIt.get<ClassA>()} ${getIt.get<ClassA>().hashCode} ${getIt.get<ClassA>().hashCode}");

    // Abstract

    // Use abstract implementation here

    print("ClassF 2");
  } catch (e) {
    print("initFeature1 $e");
  }
}
