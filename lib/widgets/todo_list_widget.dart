import 'package:flutter/material.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 40),
      children: [
        const ListTile(
          title: Text(
            "Ir ao supermercado",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text('02/12/2020'),
        ),
        ListTile(
          title: Text(
            "Ir a academia",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          subtitle: const Text('02/12/2020'),
        ),
      ],
    );
  }
}
