import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmagy/data/services/appointment_service.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final AppointmentService _appService;

  HomeScreenBloc(this._appService) : super(HomeInitial()) {
    on<RegisterServicesEvent>((event, emit) async {
      await _appService.init();
      emit(HomeInitial());
    });

    on<AddAppointmentEvent>((event, emit) {
      _appService.addAppointment(
          event.firstName,
          event.lastName,
          event.beginTimeHour,
          event.beginTimeMinute,
          event.endTimeHour,
          event.endTimeMinute,
          event.appoinment,);
      emit(HomeInitial());
    });
  }
}
