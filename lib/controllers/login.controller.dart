import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teste_gaby/user.dart';

class LoginController{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication; 
    final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,);
    
    final User? firebaseUser  = (await _auth.signInWithCredential(credential)).user;

  }
  }

