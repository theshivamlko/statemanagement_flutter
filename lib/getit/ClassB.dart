import 'package:statemanagement/getit/AbstractClassF.dart';
import 'package:statemanagement/getit/ClassE.dart';

import 'ClassC.dart';
import 'ClassC.dart';
import 'ClassD.dart';

class ClassB {
  int classBCounter = 0;
  AbstractClassF classC;
  ClassD classD;
  ClassE classE;

  ClassB(this.classC, this.classD, this.classE) {
    print("constructor CLASS B $classBCounter");
  }
}
