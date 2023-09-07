

import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver{
    @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print("MyBlocObserver onCreate ${bloc.state.counter}  ");

  }
    @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print("MyBlocObserver onChange ${change.currentState.counter} ${change.nextState.counter}");

  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
    print("MyBlocObserver onClose ${bloc.state.counter}  ");

  }

}