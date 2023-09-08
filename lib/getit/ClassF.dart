import 'ClassD.dart';
import 'ClassE.dart';

class ClassF {
  int classFCounter = 0;

  ClassE classE;

  ClassF(this.classE) {
    print("constructor CLASS F $classFCounter");
  }
}
