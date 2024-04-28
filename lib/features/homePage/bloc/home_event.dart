part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class NavigateEvent extends HomeEvent{
  final HospitalModel clickedHospital;

  NavigateEvent({required this.clickedHospital});
}