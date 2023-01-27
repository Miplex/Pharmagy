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
    on<SheduleListCardEvent>(_onListCard);
    
    
  }

  

  void _onListCard(
      SheduleListCardEvent event, Emitter<SheduleAppointmentState> emit) {
    final allAppointment = _appService.getAllAppointment();
    emit(ShdeduleListCardState(allAppointment));
  }
}
