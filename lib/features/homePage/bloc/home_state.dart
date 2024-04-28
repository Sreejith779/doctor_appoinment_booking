part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}


class HomeLoadedState extends HomeState{
  final List hospitals = hospitalsList.map((e) => Hospital(name:e ['name'],
      place: e['place'], rating: e['rating'],
      doctors: e['doctors'], hospitalImg: e['hospitalImg'])).toList();
}
