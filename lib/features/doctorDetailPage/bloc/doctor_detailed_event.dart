part of 'doctor_detailed_bloc.dart';

@immutable
abstract class DoctorDetailedEvent {}

class DetailedInitialEvent extends DoctorDetailedEvent{
  final Map clickedDoctor;

  DetailedInitialEvent({required this.clickedDoctor});
}
