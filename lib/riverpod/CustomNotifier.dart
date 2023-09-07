import 'package:statemanagement/AppState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'CustomNotifier.g.dart';

@Riverpod(keepAlive: false)
class CustomNotifier extends _$CustomNotifier {
  @override
  AppState build() {
    return AppState.count(500);
  }

  void increment() {
    state = state.copy(counter: ++state.counter );
  }
}
