import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_appoinment_booking/models/hospitalList.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<NavigateEvent>(navigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }

  FutureOr<void> navigateEvent(NavigateEvent event, Emitter<HomeState> emit) {
    emit(NavigateActionState(clickedHospitals: event.clickedHospital));
    print(event.clickedHospital);
    emit(HomeLoadedState());
  }
}
