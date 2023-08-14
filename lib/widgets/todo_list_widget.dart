import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste_gaby/widgets/busy_widget.dart';

import '../controllers/todo_controller.dart';
import '../store/app_store.dart';

class TodosList extends StatelessWidget {
  TodosList({super.key});
  final dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = TodoController(store);

    final _dateFormat = DateFormat('dd/MM/yyyy');
    return Observer(
      builder: (_) => TDBusy(
        busy: store.busy,
        child: store.todos.length == 0
            ? Center(
                child: Text('Nenhuma tarefa encontrada!'),
              )
            : ListView.builder(
                padding: EdgeInsets.only(
                  left: 40,
                ),
                itemCount: store.todos.length,
                itemBuilder: (context, index) {
                  var todo = store.todos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            todo.done ? Colors.black.withRed(02) : Colors.black,
                      ),
                    ),
                    subtitle: Text(_dateFormat.format(todo.date)),
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return AlertDialog(
                              title: Text("Concluir a tarefa ${todo.title}?"),
                              actions: [
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancelar"),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    controller.add(todo).then((data) {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text(
                                    'Concluir',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  );
                }),
      ),
    );
  }
}
