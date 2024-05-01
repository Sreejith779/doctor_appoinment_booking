part of 'search_bloc.dart';

@immutable
abstract class SearchState {}
abstract class SearchActionState extends SearchState{}

  class SearchInitial extends SearchState {}

class SearchLoadedState extends SearchState{}
