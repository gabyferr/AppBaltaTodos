import 'package:flutter/material.dart';
import 'package:teste_gaby/components/avatar_widget.dart';
import 'package:teste_gaby/controllers/login.controller.dart';

class UserCard extends StatelessWidget {
  UserCard({super.key});
  final controller = LoginController();

  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/images/notification.png"),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          TDAvatar(
            path: null,
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            // user.name
            "Marco Antonio",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 20,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
              onPressed: () {
                // controller.logout().then((sata) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LoginView(),
                //     ),
                //   );
                // });
              },
              child: const Text(
                'Sair',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
