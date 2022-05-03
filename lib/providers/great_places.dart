import 'dart:io';

import 'package:flutter/foundation.dart';

import '../domain/entities/place_location_entity.dart';
import '../domain/entities/place_entity.dart';
import '../infrastructure/helpers/db_helper.dart';
import '../infrastructure/helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<PlaceEntity> _items = [];

  List<PlaceEntity> get items {
    return [..._items];
  }

  PlaceEntity findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  Future<void> addPlace(
    String pickedTitle,
    File pickedImage,
    PlaceLocationEntity pickedLocation,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updatedLocation = PlaceLocationEntity(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: address,
    );
    final newPlace = PlaceEntity(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => PlaceEntity(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocationEntity(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
