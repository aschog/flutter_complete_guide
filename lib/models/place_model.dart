import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/domain/entities/place_entity.dart';

import 'place_location_model.dart';

class PlaceModel extends PlaceEntity {
  PlaceModel({
    @required String id,
    @required String title,
    @required PlaceLocationModel location,
    @required File image,
  }) : super(id: id, title: title, location: location, image: image);
}
