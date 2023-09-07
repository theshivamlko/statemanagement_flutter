import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:statemanagement/AppState.dart';

class CounterCubit extends Cubit<AppState> with HydratedMixin<AppState>{
  CounterCubit() : super(AppState());

  void increment() {
    emit(AppState.count(state.counter + 1));
   }

  @override
  void onChange(Change<AppState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("CounterCubit onChange ${change.currentState.counter} ${change.nextState.counter}");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print("CounterCubit onError ${error}");

  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toMap();
  }
}
