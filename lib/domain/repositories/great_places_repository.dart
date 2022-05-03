import 'package:dartz/dartz.dart';

import '../entities/place_entity.dart';
import '../failures/failures.dart';

abstract class GreatPlacesRepository {
  Future<Either<Failure, List<PlaceEntity>>> getPlacesListFromDB();
}
