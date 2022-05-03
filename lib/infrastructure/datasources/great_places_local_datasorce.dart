import 'dart:io';

import 'package:flutter_complete_guide/models/place_model.dart';

import '../../domain/entities/place_location_entity.dart';
import '../../domain/entities/place_entity.dart';
import '../../models/place_location_model.dart';
import '../helpers/db_helper.dart';

abstract class GreatPlacesLocalDatasource {
  Future<List<PlaceEntity>> fetchAndSetPlaces();
}

class GreatPlacesLocalDatasourceImpl implements GreatPlacesLocalDatasource {
  @override
  Future<List<PlaceEntity>> fetchAndSetPlaces() async {
    final response = await DBHelper.getData('user_places');

    return fromDB(response);
  }

  List<PlaceModel> fromDB(List<Map<String, dynamic>> dataList) {
    List<PlaceModel> items = [];
    items = dataList
        .map(
          (item) => PlaceModel(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocationModel(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    return items;
  }
}
