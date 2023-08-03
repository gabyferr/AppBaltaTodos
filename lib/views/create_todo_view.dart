import 'package:flutter/material.dart';
import 'package:teste_gaby/components/button_widget.dart';
import 'package:teste_gaby/widgets/user_card_widget.dart';

class CreateTodoView extends StatelessWidget {
  const CreateTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserCard(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Tarefa',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color((0xFFfa4d73)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "02/12/2020",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Altrar data",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40,
                top: 20,
                bottom: 10,
              ),
              child: TDButton(
                text: "Salvar",
                width: double.infinity,
                callback: () {},
              ),
            ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              onPressed: () {},
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
