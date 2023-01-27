import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmagy/data/model/appointment_data.dart';
import 'package:pharmagy/data/services/appointment_service.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final AppointmentService _appService;

  HomeScreenBloc(this._appService) : super(HomeInitial()) {
    on<HomeListCardEvent>(_onListCard);
    on<RegisterServicesEvent>((event, emit) async {
      await _appService.init();
      emit(HomeInitial());
    });

    on<AddAppointmentEvent>((event, emit) {
      // final currentState = state as HomeListCardState;
      // print('AddAppointmentEvent');
      _appService.addAppointment(
          event.firstName,
          event.lastName,
          event.beginTimeHour,
          event.beginTimeMinute,
          event.endTimeHour,
          event.endTimeMinute,
          event.appoinment);
      emit(HomeInitial());
    });

    on<TestEvent>(
      (event, emit) {
        final allAppointment = _appService.getAllAppointment();
        for (final total in allAppointment) {
          // print(total.toString());
        }
        // print(allAppointment.map((e) => e));
      },
    );
  }

  void _onListCard(HomeListCardEvent event, Emitter<HomeScreenState> emit) {
   // final state = this.state;
    final allAppointment = _appService.getAllAppointment();
    //final itemCards = _appDataService.itemCard;
    emit(HomeListCardState(allAppointment));
    print('HomeListCardEvent');
  }
}
