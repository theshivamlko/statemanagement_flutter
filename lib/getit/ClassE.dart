import 'ClassD.dart';
import 'ClassF.dart';

class ClassE {
  int classECounter = 0;

  ClassE() {
   }

  Future<ClassF> getClassF() async {
    await Future.delayed(Duration(seconds: 5));
    print("getClassF ");
    return ClassF(this);
  }
}
