part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserCredential userCredential;

  RegisterSuccess(this.userCredential);
}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure(this.errMessage);
}

class RegisterCodeSent extends RegisterState {
  final String verificationId;

  RegisterCodeSent(this.verificationId);

  List<Object?> get props => [verificationId];
}
