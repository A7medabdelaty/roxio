import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roxio/core/failures/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, Position>> getCurrentLocation();
}
