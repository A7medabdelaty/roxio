part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetCurrentLocationLoading extends HomeState {}

final class HomeGetCurrentLocationSuccess extends HomeState {}

final class HomeGetCurrentLocationFailure extends HomeState {}
