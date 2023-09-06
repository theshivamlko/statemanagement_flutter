import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Clock extends StateNotifier<DateTime> {



  late final Timer _timer;
  DateTime? dateTime;

  // 1. initialize with current time
  Clock() : super(DateTime.now()) {
    // 2. create a timer that fires every second
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      // 3. update the state with the current time
      state = DateTime.now();

    });
  }

  void changeTime(){


  }


  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    print("Clock dispose");
    super.dispose();
  }
}