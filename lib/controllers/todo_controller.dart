import 'package:teste_gaby/repositories/todos_repository.dart';
import 'package:teste_gaby/store/app_store.dart';

class TodoController{
  late AppStore _store;
  late TodosRepository _repository;

  TodoController(AppStorestore){
    _store = _store;
    _repository = TodosRepository();
  }

  void changeSelection (String selection){
    _store.clearTodos();

    switch(selection){
      case "today":
      _store.busy = true;
      _store.changeSelected("todoy");
      _repository.getTodayTodos().then((data){
        _store.setTodos(data);
        _store.busy = false;
      });
      return;
    }
      switch(selection){
      case "tomorrow":
      _store.busy = true;
      _store.changeSelected("tomorrow");
      _repository.getTodayTodos().then((data){
        _store.setTodos(data);
        _store.busy = false;
      });
      return;
    }
      switch(selection){
      case "all":
      _store.busy = true;
      _store.changeSelected("all");
      _repository.getTodayTodos().then((data){
        _store.setTodos(data);
        _store.busy = false;
      });
      return;
    }
  }
}