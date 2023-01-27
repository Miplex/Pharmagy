
part of 'shedule_appointment_bloc.dart';

abstract class SheduleAppointmentState extends Equatable {}

class SheduleAppointmentInitialState extends SheduleAppointmentState {
  @override

  List<Object?> get props => [];
}

class ShdeduleListCardState extends SheduleAppointmentState {
  final List<AppointmentData> allItemsCard;
  ShdeduleListCardState(
    this.allItemsCard,
  );

  @override
  List<Object?> get props => [allItemsCard];
}
