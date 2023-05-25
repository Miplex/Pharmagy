part of 'clock_screen_cubit.dart';

abstract class ClockScreenState extends Equatable {
}

class ClockScreenInitialState extends ClockScreenState {
  @override
  List<Object?> get props => [];
}

class ClockUpdateState extends ClockScreenState {
  final String time;

 ClockUpdateState({required this.time});
  
  @override
  List<Object?> get props => [time];

}