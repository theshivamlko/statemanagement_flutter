import 'package:statemanagement/getit/AbstractClassF.dart';
import 'package:statemanagement/getit/ClassE.dart';

import 'ClassD.dart';

class ClassC implements AbstractClassF {
  int classCCounter = 0;
  ClassD classD;
  ClassE classE;

  ClassC(this.classD, this.classE) {
    print("CLASS C $classCCounter");
  }

  @override
  String getData() {
    print("constructor CLASS C getData $classCCounter");
    return classCCounter.toString();
  }
}
