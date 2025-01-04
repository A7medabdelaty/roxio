import 'package:firebase_auth/firebase_auth.dart';
import 'package:roxio/core/utils/services/remote/firebase_auth_service.dart';
import 'package:roxio/services/register/data/repos/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final FirebaseAuthService _firebaseAuthService;

  RegisterRepoImpl(this._firebaseAuthService);

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuthService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<UserCredential?> signInWithPhone({
    required String verificationId,
    required String smsCode,
  }) async {
    return await _firebaseAuthService.signInWithPhone(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }
}
