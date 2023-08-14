import 'package:teste_gaby/models/todo_item_model.dart';
import 'package:teste_gaby/repositories/todos_repository.dart';
import 'package:teste_gaby/store/app_store.dart';

class TodoController {
  final AppStore _store;
  late TodosRepository _repository;

  TodoController(this._store) {
    _repository = TodosRepository('');
  }

  void changeSelection(String selection) {
    _store.clearTodos();

    switch (selection) {
      case "today":
        _store.busy = true;
        _store.changeSelected("todoy");
        _repository.getTodayTodos().then((data) {
          _store.setTodos(data);
          _store.busy = false;
        });
        return;
    }
    switch (selection) {
      case "tomorrow":
        _store.busy = true;
        _store.changeSelected("tomorrow");
        _repository.getTodayTodos().then((data) {
          _store.setTodos(data);
          _store.busy = false;
        });
        return;
    }
    switch (selection) {
      case "all":
        _store.busy = true;
        _store.changeSelected("all");
        _repository.getTodayTodos().then((data) {
          _store.setTodos(data);
          _store.busy = false;
        });
        return;
    }
  }

  Future add(TodoItem item) async {
    _store.busy = true;
    await _repository.add(item);
    _store.busy = false;
    changeSelection(_store.currentState);
  }
}
