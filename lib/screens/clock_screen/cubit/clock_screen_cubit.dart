import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'clock_screen_state.dart';

class ClockScreenCubit extends Cubit<ClockScreenState> {
  ClockScreenCubit() : super(ClockScreenInitialState());

      
    Future<void> changeTime () async{

      Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        final time = DateFormat.Hms().format(now);
        emit(ClockUpdateState(time: time));
   });

     // final time = DateFormat.Hms().format(now);
      final prev = DateTime.now().add(const Duration(seconds: 1));
 
      
     //disp += test;
    //  Future.delayed( const Duration(seconds: 1), (){
    //   emit(ClockUpdateState(time: prev.second.toString()));
    //  });

//emit(state +1);
// Timer.periodic(const Duration(seconds: 1), (timer) {
//   });
  // int index = 0;
  //  if(prev != now){
      //emit(ClockUpdateState(time: prev.second.toString()));
  //  }
      
    //final time = DateFormat.Hms().format(now);
    }
}
