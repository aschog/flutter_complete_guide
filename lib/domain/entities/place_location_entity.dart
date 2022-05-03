import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocationEntity {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocationEntity({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}
