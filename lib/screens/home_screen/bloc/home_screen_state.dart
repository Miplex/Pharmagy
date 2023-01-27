part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
  
}

class HomeListCardState extends HomeScreenState {
  final List<AppointmentData> allItemsCard;
  const HomeListCardState(
    this.allItemsCard,
  );

  @override
  List<Object> get props => [allItemsCard];
}
