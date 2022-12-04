import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmagy/data/model/appointment_data.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeListCardState> {
  HomeScreenBloc() : super(const HomeListCardState()) {
    on<HomeListCardEvent>(_onListCard);
  }

  void _onListCard(HomeListCardEvent event, Emitter<HomeListCardState> emit) {
    final state = this.state;
    emit(HomeListCardState(allItemsCard: List.from(state.allItemsCard)..add(event.listData)));
  }
}
