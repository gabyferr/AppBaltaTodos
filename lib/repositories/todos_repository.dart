import 'package:teste_gaby/models/todo_item_model.dart';

class TodosRepository{
  Future<List<TodoItem>> getTodayTodos() async {
    return <TodoItem>[];
  }
  Future<List<TodoItem>?> getTomorrowTodos() async {
   var todos = <TodoItem>[];
   todos.add(
    TodoItem(
      id: "123456", 
      title: "Amanhã", 
      done: false, 
      date: DateTime.now())
   );
   await Future.delayed(const Duration(milliseconds: 1500),() {});
   return todos;
  }
  Future<List<TodoItem>?> getAllTodos() async {
    var todos = <TodoItem>[];
      TodoItem(
      id: "123456", 
      title: "hoje", 
      done: false, 
      date: DateTime.now()
   );
   await Future.delayed(const Duration(milliseconds: 1500),() {});
   return todos;
  }
  Future<TodoItem?> add (TodoItem item) async{
   var todos = <TodoItem>[];
   todos.add(
    TodoItem(
      id: "1234567", 
      title: "Amanhã", 
      done: false, 
      date: DateTime.now())
   );
  //  await Future.delayed(const Duration(milliseconds: 1500),() {});
  //  return todos;
  }
  
  //  Future<TodoItem?> add (TodoItem item) async{
  //   return null;
    // return TodoItem(id: '0', title: 'title', done: true, date: DateTime.now());
  // }
    Future<TodoItem?> marckAsDone (TodoItem item) async{
    return null;
    }
}