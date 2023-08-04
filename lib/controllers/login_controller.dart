import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teste_gaby/user.dart';

class LoginController {
  static final LoginController _singleton = LoginController._internal();
  late IUser user;

  factory LoginController() {
    return _singleton;
  }
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginController._internal();

  Future<IUser> login() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;


    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? firebaseUser =
        (await _auth.signInWithCredential(credential)).user;

    var token = await firebaseUser?.getIdToken();

    return user = IUser(
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
