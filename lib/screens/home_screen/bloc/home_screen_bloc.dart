import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmagy/data/model/appointment_data.dart';
import 'package:pharmagy/data/services/appointment_data_service.dart';
import 'package:pharmagy/locator.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeListCardState> {
  final AppointmentDataService _appDataService =
      locator<AppointmentDataService>();

  HomeScreenBloc() : super(const HomeListCardState()) {
    on<HomeListCardEvent>(_onListCard);
  }

  void _onListCard(HomeListCardEvent event, Emitter<HomeListCardState> emit) {
    final state = this.state;
    //final itemCards = _appDataService.itemCard;
    emit(HomeListCardState(
        allItemsCard: List.from(state.allItemsCard)..add(event.listData)));
    //print(state.allItemsCard);
  }
}
