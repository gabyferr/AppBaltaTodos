import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_gaby/controllers/todo_controller.dart';
import 'package:teste_gaby/views/create_todo_view.dart';
import 'package:teste_gaby/widgets/navbar_widget.dart';
import 'package:teste_gaby/widgets/todo_list_widget.dart';
import 'package:teste_gaby/widgets/user_card_widget.dart';
import '../store/app_store.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = TodoController(store);

    if (store.currentState == "none") {
      controller.changeSelection("today");
    }

    return Scaffold(
      body: Column(
        children: [
          UserCard(),
          NavBar(),
          Expanded(
            child: TodosList(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTodoView(),
            ),
          );
        },
        backgroundColor: const Color((0xFFfa4d73)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
