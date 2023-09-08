import 'ClassD.dart';
import 'ClassF.dart';

class ClassE {
  int classECounter = 0;

  ClassE() {
    print("constructor CLASS E $classECounter");
  }

  Future<ClassF> getClassF() async {
    await Future.delayed(Duration(seconds: 2));
    return ClassF(this);
  }
}
