part of 'places_list_screen_bloc.dart';

@immutable
abstract class PlacesListScreenState {}

class PlacesListScreenInitial extends PlacesListScreenState {}

class PlacesListScreenLoading extends PlacesListScreenState {}

class PlacesListScreenLoaded extends PlacesListScreenState {
  //@override
  List<Object> get props => [places];
  final List<PlaceEntity> places;
  PlacesListScreenLoaded({@required this.places});
}

class PlacesListScreenError extends PlacesListScreenState {
  //@override
  List<Object> get props => [message];
  final String message;

  PlacesListScreenError({@required this.message});
}
