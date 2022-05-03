import 'dart:io';

import 'package:flutter_complete_guide/domain/repositories/great_places_repository.dart';
import 'package:flutter_complete_guide/infrastructure/repositories/great_places_repository.dart';

import '../entities/place_location_entity.dart';
import '../entities/place_entity.dart';
import '../failures/failures.dart';
import 'package:dartz/dartz.dart';

class GreatePlacesUsecases {
  final GreatPlacesRepository greatPlacesRepository =
      GreatPlacesRepositoryImpl();
  Future sleep1() {
    return Future.delayed(Duration(seconds: 2), () => "1");
  }

  Future<Either<Failure, List<PlaceEntity>>> fetchAndSetPlacesUsecase() async {
    await sleep1();

    return greatPlacesRepository.getPlacesListFromDB();

    //return Left(ServerFailure());
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
