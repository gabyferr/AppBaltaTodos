import 'package:flutter/material.dart';

class TodoItem{
String id;
String title;
bool done;
DateTime date;

TodoItem({required this.id, required this.title, required this.done, required this.date});

  TodoItem.fromJson(Map<String, dynamic> json){
  id = json['id'];
  title = json['done'];
  done = json['done'];
  date = DateTime.parse(json['date']);
}

Map<String, dynamic> toJson(){
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['id'] = this.id;
  data ['title'] = this.title;
  data['done'] = this.done;
  data['date'] = this.date.toString();
  return data;
}

}

