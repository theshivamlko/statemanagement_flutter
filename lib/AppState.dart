import 'dart:async';

import 'package:flutter/material.dart';

class AppState{
  Color? background;
  int  counter=0;
  StreamController controller=StreamController.broadcast();
    copy(int counter, Color background){
     this.counter=counter;
    this.background=background;
   }

}
