import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_detailed_event.dart';
part 'doctor_detailed_state.dart';

class DoctorDetailedBloc extends Bloc<DoctorDetailedEvent, DoctorDetailedState> {
  DoctorDetailedBloc() : super(DoctorDetailedInitial()) {
 on<DetailedInitialEvent>(detailedInitialEvent);
  }

  FutureOr<void> detailedInitialEvent(DetailedInitialEvent event, Emitter<DoctorDetailedState> emit) {
    List<dynamic> timings =
    event.clickedDoctor['bookingTimings'].map((e) => e['time']).toList();
    emit(DoctorDetailedLoadedState(clickedDoctor: event.clickedDoctor, timings: timings));
  }
}
