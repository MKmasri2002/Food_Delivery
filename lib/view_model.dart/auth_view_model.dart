import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  String _phone = "";
  String get phone => _phone;
  Future<void> sendOTP(String phone) async {
    if (phone == "+962793313222") {
      _phone = phone;
      // الرقم الوهمي
      verificationId = "123456";
      notifyListeners();
      log("✅ Dummy OTP code sent to $phone");
      return;
    }

    // باقي الكود الحقيقي
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,

      verificationCompleted: (PhoneAuthCredential credential) {
        log("Auto verification completed");
      },
      verificationFailed: (FirebaseAuthException e) {
        log("Verification failed: ${e.message}");
      },
      codeSent: (String verId, int? resendToken) {
        verificationId = verId;
        notifyListeners();
        log("Code sent to $phone");
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  }
///////////////////////////////
   User? _user;
  User? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get emailVerified => _user?.emailVerified ?? false;

  AuthViewModel() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = cred.user;

      // إرسال رابط التحقق للبريد
      if (!_user!.emailVerified) {
        await _user!.sendEmailVerification();
      }

      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'حدث خطأ غير معروف';
    }
  }

  // إعادة تحميل حالة البريد
  Future<void> reloadUser() async {
    await _user?.reload();
    _user = _auth.currentUser;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

}
