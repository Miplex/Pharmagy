import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'clock_screen_state.dart';

class ClockScreenCubit extends Cubit<ClockScreenState> {
  ClockScreenCubit() : super(ClockScreenInitialState(initialTime: DateTime.now().toString()));
      

    Future<void> changeTime (bool startTimer) async{
        // final now = DateTime.now();
        // final time = DateFormat('h:mm').format(now);
        // final timeFormate = DateFormat('a').format(now);
        // emit(ClockUpdateState(time: time, timePMformat: timeFormate));
      Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        final time = DateFormat('hh : mm').format(now);
        final second = DateFormat('s').format(now);
        final timeFormate = DateFormat('a').format(now);
        emit(ClockUpdateState(time: time, second: second, timePMformat: timeFormate));
        if(!startTimer){
          timer.cancel();
         // print(startTimer);
        }
   });

  
    }
}
