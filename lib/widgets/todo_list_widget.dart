import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste_gaby/widgets/busy_widget.dart';

import '../store/app_store.dart';

class TodosList extends StatelessWidget {
  TodosList({super.key});
  final dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final _dateFormat = DateFormat('dd/MM/yyyy');
    return Observer(
      builder: (_) =>
      TDBusy(busy:  store.busy,
      child:store.todos.length == 0
      ?Center(
      child: Text('Nenhuma tarefa encontrada!'),
      )
      : ListView.builder(itemBuilder: (BuildContext context, int index) { 
          return SizedBox();
        },
       ), 
      )
    );
  }
}
