import 'package:flutter/services.dart';
import 'package:flutter_mobile/import.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class BiometricManager {
  static final BiometricManager share = BiometricManager();

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<List<BiometricType>?> getListOfBiometricTypes() async {
    List<BiometricType>? listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return listOfBiometrics;
  }

  Future<bool> isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return isAvailable;
  }

  Future<bool> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: LocaleKeys.localizedReason_login.tr,
        useErrorDialogs: false,
        stickyAuth: true,
        androidAuthStrings: AndroidAuthMessages(
          signInTitle: LocaleKeys.signInTitle_login.tr,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    return isAuthenticated;
  }
}
