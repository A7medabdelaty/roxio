import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });

  Future<UserCredential?> signInWithPhone({
    required String verificationId,
    required String smsCode,
  });
}
