
 import 'package:riverpod/riverpod.dart';
import 'package:statemanagement/AppState.dart';

class MyBlocNotifier extends StateNotifier<AppState>{

  AppState appState = AppState();

  MyBlocNotifier(super.state);



  void increment(){
    appState.counter++;

  }


}
