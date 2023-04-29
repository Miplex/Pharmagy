import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/data/model/appointment_data.dart';
import 'package:pharmagy/data/services/appointment_service.dart';

part 'shedule_appointment_event.dart';
part 'shedule_appointment_state.dart';

class SheduleAppointmentBloc
    extends Bloc<SheduleAppointmentEvent, SheduleAppointmentState> {
  final AppointmentService _appService;

  SheduleAppointmentBloc(this._appService)
      : super(SheduleAppointmentInitialState()) {
   // on<RegisterServicesEvent>(_onRegisterService);
    on<SheduleListCardEvent>(_onGetAllAppointment);
    on<SheduleAppointmentDeleteEvent>(_onDeleteAppointment);
    on<SheduleAppointmentUpdateEvent>(_onUpdateAppointment);
  }

  // void _onRegisterService(RegisterServicesEvent event,
  //     Emitter<SheduleAppointmentState> emit) async {
  //   await _appService.init();
  //   emit(SheduleAppointmentInitialState());
  // }

  void _onGetAllAppointment(
      SheduleListCardEvent event, Emitter<SheduleAppointmentState> emit) {
    final allAppointment = _appService.getAllAppointment();
    emit(SheduleListCardState(allAppointment));
  }

  void _onDeleteAppointment(SheduleAppointmentDeleteEvent event,
      Emitter<SheduleAppointmentState> emit) {
    _appService.deleteAppointment(event.id);
    add(SheduleListCardEvent());
  }

  void _onUpdateAppointment(SheduleAppointmentUpdateEvent event,
      Emitter<SheduleAppointmentState> emit) {
    _appService.updateAppointment(
        event.id,
        event.firstName,
        event.lastName,
        event.beginTimeHour,
        event.beginTimeMinute,
        event.endTimeHour,
        event.endTimeMinute,
        event.appointment);
    add(SheduleListCardEvent());
  }
}
