part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetCurrentLocationLoading extends HomeState {}

final class HomeGetCurrentLocationSuccess extends HomeState {
  final Position position;

  HomeGetCurrentLocationSuccess(this.position);
}

final class HomeGetCurrentLocationFailure extends HomeState {
  final String errMessage;

  HomeGetCurrentLocationFailure(this.errMessage);
}
