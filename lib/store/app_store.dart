import 'package:mobx/mobx.dart';
import 'package:teste_gaby/models/todo_item_model.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  
  @observable
  String currentState = "none";
  @observable
  bool busy = false;
  @observable
  ObservableList<TodoItem> todos = ObservableList<TodoItem>();

@action
  void changeSelected(String state) {
    currentState = state;
  }

@action
  void add (TodoItem item) {
    todos.add(item);
  }

@action
  void setTodos(List<TodoItem> itens) {
    todos.addAll(itens);
  }

@action
  void clearTodos() {
    todos = ObservableList<TodoItem>();
  }
}