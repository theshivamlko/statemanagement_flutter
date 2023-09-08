import 'AbstractClassC.dart';
import 'ClassB.dart';
import 'ClassC.dart';
import 'ClassD.dart';
import 'ClassE.dart';



class ClassA {
  int classACounter = 0;
  ClassB classB;
  AbstractClassC classC;
  ClassD classD;
  ClassE classE;

  ClassA(this.classB, this.classC, this.classD, this.classE) {
    print("constructor CLASS A $classACounter ${classC.getData()}");
  }
}
