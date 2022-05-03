import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_complete_guide/domain/failures/failures.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/place_entity.dart';
import '../../domain/usecases/great_places_usecases.dart';

part 'places_list_screen_event.dart';
part 'places_list_screen_state.dart';

const GENERAL_FAILURE_MESSAGE = "Ups, something gone wrong. Please try again!";
const SERVER_FAILURE_MESSAGE = "Ups, API Error. please try again!";

class PlacesListScreenBloc
    extends Bloc<PlacesListScreenEvent, PlacesListScreenState> {
  final usecases = GreatePlacesUsecases();
  PlacesListScreenBloc() : super(PlacesListScreenInitial()) {
    on<PlacesListScreenEvent>((event, emit) async {
      emit(PlacesListScreenLoading());
      Either<Failure, List<PlaceEntity>> placesOrFailure =
          await usecases.fetchAndSetPlacesUsecase();
      placesOrFailure.fold(
        (failure) =>
            emit(PlacesListScreenError(message: _mapFailureToMessage(failure))),
        (places) => emit(PlacesListScreenLoaded(places: places)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case GeneralFailure:
        return GENERAL_FAILURE_MESSAGE;

      default:
        return GENERAL_FAILURE_MESSAGE;
    }
  }
}
