import 'package:flutter/material.dart';
import 'package:teste_gaby/widgets/navbar_widget.dart';
import 'package:teste_gaby/widgets/todo_list_widget.dart';
import 'package:teste_gaby/widgets/user_card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          UserCard(),
          NavBar(),
          Expanded(
            child: TodosList(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color((0xFFfa4d73)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
