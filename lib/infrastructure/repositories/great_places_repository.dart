import 'package:flutter_complete_guide/domain/failures/failures.dart';

import 'package:flutter_complete_guide/domain/entities/place_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_complete_guide/infrastructure/datasources/great_places_local_datasorce.dart';

import '../../domain/repositories/great_places_repository.dart';

class GreatPlacesRepositoryImpl implements GreatPlacesRepository {
  final GreatPlacesLocalDatasource greatPlacesLocalDatasource =
      GreatPlacesLocalDatasourceImpl();
  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlacesListFromDB() async {
    try {
      final greatPlaces = await greatPlacesLocalDatasource.fetchAndSetPlaces();

      return Right(greatPlaces);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
