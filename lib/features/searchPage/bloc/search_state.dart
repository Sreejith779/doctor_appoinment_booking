part of 'search_bloc.dart';

@immutable
abstract class SearchState {}
abstract class SearchActionState extends SearchState{}

  class SearchInitial extends SearchState {}

class SearchLoadedState extends SearchState{
  final List<HospitalModel>hospitals = hospitalsList
      .map((e) => HospitalModel(
      name: e['name'],
      place: e['place'],
      rating: e['rating'],
      doctors: e['doctors'],
      hospitalImg: e['hospitalImg'], doctorImg: e['doctorImg']))
      .toList();

  final List<DoctorModel>doctors = doctorsList.map((e) =>
  DoctorModel(name:e ["name"], specialty:e ['specialty'], hName: e['hName'])).toList();

  List<DoctorModel>doctorSort(){
    doctors.sort((a,b)=>a.name.compareTo(b.name));
    return doctors;
  }

}
