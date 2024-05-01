part of 'doctor_detailed_bloc.dart';

@immutable
abstract class DoctorDetailedState {}
abstract class DoctorDetailedActionState extends DoctorDetailedState {}

 class DoctorDetailedInitial extends DoctorDetailedState {}

class DoctorDetailedLoadedState extends DoctorDetailedState{
 final List timings;
   final Map clickedDoctor;
   String selectedSlotIndex;

  DoctorDetailedLoadedState({required this.clickedDoctor,required this.timings,required this.selectedSlotIndex});

}
