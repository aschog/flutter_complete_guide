part of 'places_list_screen_bloc.dart';

@immutable
abstract class PlacesListScreenState {}

class PlacesListScreenInitial extends PlacesListScreenState {}

class PlacesListScreenLoading extends PlacesListScreenState {}

class PlacesListScreenLoaded extends PlacesListScreenState {}

class PlacesListScreenError extends PlacesListScreenState {}
