part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final List hospitals = hospitalsList
      .map((e) => HospitalModel(
          name: e['name'],
          place: e['place'],
          rating: e['rating'],
          doctors: e['doctors'],
          hospitalImg: e['hospitalImg']))
      .toList();
}

class NavigateActionState extends HomeActionState {
  final HospitalModel clickedHospitals;

  NavigateActionState({required this.clickedHospitals});
}
