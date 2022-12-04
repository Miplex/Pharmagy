part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeListCardState extends HomeScreenState {
  final List<AppointmentData> allItemsCard;
  const HomeListCardState({
    this.allItemsCard = const <AppointmentData>[],
  });

  @override
  List<Object> get props => [allItemsCard];
}
