import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:roxio/services/register/data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  final RegisterRepo _registerRepo;

  void verifyPhoneNumber(String phoneNumber) async {
    emit(RegisterLoading());
    await _registerRepo.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential? userCredential = await _registerRepo.signInWithPhone(
          verificationId: credential.verificationId!,
          smsCode: credential.smsCode!,
        );
        emit(RegisterSuccess(userCredential!));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(RegisterFailure(e.message ?? 'Verification failed'));
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(RegisterCodeSent(verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(RegisterFailure('Code retrieval timeout'));
      },
    );
  }

  void signInWithPhone(String verificationId, String smsCode) async {
    emit(RegisterLoading());
    try {
      UserCredential? userCredential = await _registerRepo.signInWithPhone(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      if (userCredential != null) {
        emit(RegisterSuccess(userCredential));
      } else {
        emit(RegisterFailure('Sign in failed'));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
