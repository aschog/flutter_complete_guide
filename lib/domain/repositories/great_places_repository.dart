import '../entities/place.dart';

abstract class AdvicerRepository {
  Future<List<Place>> getPlacesListFromDB();
}
