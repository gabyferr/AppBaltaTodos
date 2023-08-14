import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste_gaby/components/button_widget.dart';
import 'package:teste_gaby/controllers/todo_controller.dart';
import 'package:teste_gaby/models/todo_item_model.dart';
import 'package:teste_gaby/store/app_store.dart';
import 'package:teste_gaby/views/home_view.dart';
import 'package:teste_gaby/widgets/user_card_widget.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({super.key});

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final _formkey = GlobalKey<FormState>();
  final _dateFormat = new DateFormat('dd/MM/yyyy');

  String task = "";
  DateTime date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = TodoController(store);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserCard(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              key: _formkey,
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Titulo Inválido';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        task = val!;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        _dateFormat.format(date),
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
                      onPressed: () {
                        _selectDate(context);
                      },
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
                callback: () {
                  if (!_formkey.currentState!.validate()) {
                    return;
                  }
                  _formkey.currentState!.save();
                  var todo =
                      TodoItem(title: task, date: date, done: true, id: ",");

                  controller.add(todo).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  });
                },
              ),
            ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );
              },
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
