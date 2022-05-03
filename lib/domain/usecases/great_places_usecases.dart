import 'dart:io';

import '../entities/PlaceLocation.dart';
import '../entities/place.dart';
import '../failures/failures.dart';
import 'package:dartz/dartz.dart';

class GreatePlacesUsecases {
  Future sleep1() {
    return Future.delayed(Duration(seconds: 2), () => "1");
  }

  Future<Either<Failure, List<Place>>> fetchAndSetPlacesUsecase() async {
    await sleep1();

    return Left(ServerFailure());
    // return Right([
    //   Place(
    //     id: '1',
    //     title: 'test_gw',
    //     location:
    //         PlaceLocation(latitude: 111, longitude: 222, address: "adress"),
    //     image: File(''),
    //   ),
    // ]);
  }
}
