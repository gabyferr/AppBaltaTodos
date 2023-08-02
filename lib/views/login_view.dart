import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste_gaby/components/button_widget.dart';
import 'package:teste_gaby/controllers/login.controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final controller = new LoginController();
  final ScaffoldKey = new GlobalKey<ScaffoldState>();
  var busy = false;

  handleSingnIn() {
    setState(() {
      busy = true;
    });
    controller.login().then((data) {
      // onSuccess();
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      // onComplete();
    });
  }

  onError() {
    var snackbar = new SnackBar(content: new Text("Falha no login"));
    // ScaffoldKey.currentState.showSnackBar(snackbar);
  }

  aaa() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'gaby@gmail.com',
        password: '12346',
      );

      print('deu bom');
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('email ou senha invaido'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Card(
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/images/notification.png",
                  width: 250,
                ),
                const Text(
                  'Olá desconhecido',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TDButton(
                  text: 'Login com Google',
                  image: 'assets/images/google.png',
                  callback: () async {
                    await aaa();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
