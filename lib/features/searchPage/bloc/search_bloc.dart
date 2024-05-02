import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_appoinment_booking/features/homePage/bloc/home_bloc.dart';
import 'package:doctor_appoinment_booking/features/searchPage/ui/searchPage.dart';
import 'package:meta/meta.dart';

import '../../../models/doctorsModel.dart';
import '../../../models/hospitalList.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
  on<SearchInitialEvent>(searchInitialEvent);
  }

  FutureOr<void> searchInitialEvent(SearchInitialEvent event, Emitter<SearchState> emit) {
 emit(SearchLoadedState());
  }
}
