part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
   @override
  List<Object> get props => [];
}

class HomeListCardEvent extends HomeScreenEvent {
  final AppointmentData listData;
  const HomeListCardEvent({
    required this.listData,
  });

  @override
  List<Object> get props => [listData];
}
