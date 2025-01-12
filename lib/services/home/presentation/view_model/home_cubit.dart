import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roxio/services/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> getCurrentLocation() async {
    emit(HomeGetCurrentLocationLoading());
    final result = await homeRepo.getCurrentLocation();
    result.fold(
      (failure) => emit(HomeGetCurrentLocationFailure(failure.errMessage)),
      (position) => emit(HomeGetCurrentLocationSuccess(position)),
    );
  }
}
