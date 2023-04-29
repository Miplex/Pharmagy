part of 'shedule_appointment_bloc.dart';

abstract class SheduleAppointmentState extends Equatable {}

class SheduleAppointmentInitialState extends SheduleAppointmentState {
  @override
  List<Object?> get props => [];
}

class SheduleListCardState extends SheduleAppointmentState {
  final List<AppointmentData> allItemsCard;
  SheduleListCardState(
    this.allItemsCard,
  );

  @override
  List<Object?> get props => [allItemsCard];
}

class SheduleAppointmentDeleteState extends SheduleAppointmentState {
  @override
  List<Object?> get props => [];
}
