import 'dart:async';

import 'package:flutter/material.dart';
import 'package:statemanagement/CommonState.dart';

class StudentState implements CommonState{
   int  roll=13842;
     copy(int roll){
     this.roll=roll;
    }

}
