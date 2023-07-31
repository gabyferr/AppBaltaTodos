import 'package:flutter/material.dart';
import 'package:teste_gaby/themes/app_theme.dart';
import 'package:teste_gaby/views/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      theme: appTheme(),
      home: const LoginView(),
    );
  }
}




