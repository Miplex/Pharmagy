part of 'clock_screen_cubit.dart';

abstract class ClockScreenState extends Equatable {
}

class ClockScreenInitialState extends ClockScreenState {
  ClockScreenInitialState({required this.initialTime});
 final String initialTime;
  @override
  List<Object?> get props => [initialTime];
}

class ClockUpdateState extends ClockScreenState {
  final String? second;
  final String time;
  final String timePMformat;
  final DateTime? dateTime;

 ClockUpdateState({required this.time, required this.timePMformat, this.dateTime, this.second});
  
  @override
  List<Object?> get props => [time, timePMformat, second];

}