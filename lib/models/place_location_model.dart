import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/domain/entities/place_location_entity.dart';

class PlaceLocationModel extends PlaceLocationEntity {
  const PlaceLocationModel({
    @required double latitude,
    @required double longitude,
    String address,
  }) : super(latitude: latitude, longitude: longitude, address: address);
}
