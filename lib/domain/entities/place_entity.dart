import 'dart:io';

import 'package:flutter/foundation.dart';

import 'place_location_entity.dart';

class PlaceEntity {
  final String id;
  final String title;
  final PlaceLocationEntity location;
  final File image;

  PlaceEntity({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
