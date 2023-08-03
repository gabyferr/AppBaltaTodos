import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teste_gaby/user.dart';

class LoginController {
  static final LoginController _singleton = LoginController._internal();

  factory LoginController() {
    return _singleton;
  }

  LoginController._internal();

  Future<IUser> login() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      return IUser();
    }

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? firebaseUser =
        (await _auth.signInWithCredential(credential)).user;

    var token = await firebaseUser?.getIdToken();

    return IUser(
      email: firebaseUser?.email,
      name: firebaseUser?.displayName,
      picture: firebaseUser?.photoURL,
      token: token,
    );
  }

  bool isLogado() {
    return false;
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
