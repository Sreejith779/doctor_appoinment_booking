import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_appoinment_booking/models/bookingList.dart';
import 'package:meta/meta.dart';

part 'doctor_detailed_event.dart';
part 'doctor_detailed_state.dart';

class DoctorDetailedBloc extends Bloc<DoctorDetailedEvent, DoctorDetailedState> {
  DoctorDetailedBloc() : super(DoctorDetailedInitial()) {
 on<DetailedInitialEvent>(detailedInitialEvent);
 on<BookingEvent>(bookingEvent);
  }
 
  FutureOr<void> detailedInitialEvent(DetailedInitialEvent event, Emitter<DoctorDetailedState> emit) {
    List<dynamic> timings =
    event.clickedDoctor['bookingTimings'].map((e) => e['time']).toList();
    emit(DoctorDetailedLoadedState(clickedDoctor: event.clickedDoctor, timings: timings, selectedSlotIndex: ''));
  }

  FutureOr<void> bookingEvent(BookingEvent event, Emitter<DoctorDetailedState> emit) {
    print("selected slot: ${event.slot.toString()}");
    print("selected date: ${event.selectedDate}");
    bookingList.add({"date":event.selectedDate,"slot":event.slot});
    print(bookingList);
    final currentState = state;

    if(currentState is DoctorDetailedLoadedState){
      emit(DoctorDetailedLoadedState(clickedDoctor:currentState.clickedDoctor,
          timings:currentState.timings, selectedSlotIndex: event.slot));

    }

  }
}
