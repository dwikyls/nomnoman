import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nomnoman/utils/api.dart';
import 'package:nomnoman/utils/dependency_injection.dart';

class AuthProvider extends ChangeNotifier {
  final _storage = locator.get<FlutterSecureStorage>();
  GoogleSignInAccount? account;
  String? accessToken;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    scopes: [
      'https://www.googleapis.com/auth/drive.metadata.readonly',
      'https://www.googleapis.com/auth/documents'
    ],
  );

  Future<void> loginViaGoogle() async {
    await _googleSignIn.signIn().then((value) async {
      print(value);

      account = value;

      await value?.authentication.then((googleKey) {
        print(googleKey.accessToken);

        putAccessToken(googleKey.accessToken);
        accessToken = googleKey.accessToken;

        notifyListeners();
      }).catchError((err) {
        print('inner error');
      });

      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> logOutGoogle() async {
    await _googleSignIn.signOut().then((value) async {
      print(value);

      account = null;
      await putAccessToken(null);

      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
