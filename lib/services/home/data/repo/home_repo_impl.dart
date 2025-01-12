import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roxio/core/failures/failure.dart';
import 'package:roxio/core/failures/map_failures.dart';
import 'package:roxio/core/utils/location_manager.dart';
import 'package:roxio/services/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final LocationManager locationManager;

  HomeRepoImpl(this.locationManager);

  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    await locationManager.requestLocationService();

    bool permissionGranted = await locationManager.requestLocationPermission();
    if (!permissionGranted) {
      return Left(MapFailure('Location permission denied.'));
    }

    return Right(await locationManager.getCurrentLocation());
  }
}
