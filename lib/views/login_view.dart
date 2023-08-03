import 'package:flutter/material.dart';
import 'package:teste_gaby/components/button_widget.dart';
import 'package:teste_gaby/controllers/login.controller.dart';
import 'package:teste_gaby/views/create_todo_view.dart';
import 'package:teste_gaby/views/home_view.dart';
import 'package:teste_gaby/widgets/busy_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final controller = new LoginController();
  final ScaffoldKey = new GlobalKey<ScaffoldState>();
  var busy = false;

  Future handleSingnIn() async {
    try {
      final result = await controller.login();
      if (result.token != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateTodoView()),
        );
        return;
      } else {
        const snackBar = SnackBar(
          content: Text('email ou senha invaido'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (err) {
      var snackBar = SnackBar(
        content: Text('$err'),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: TDBusy(
            busy: busy,
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
                      await handleSingnIn();
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
      ),
    );
  }
}
