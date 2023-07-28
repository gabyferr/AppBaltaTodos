import 'package:flutter/material.dart';
// import 'package:teste_gaby/components/avatar_widget.dart';
// import 'package:teste_gaby/components/button_widget.dart';
import 'package:teste_gaby/themes/app_theme.dart';
import 'package:teste_gaby/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      
      theme: appTheme(
       
      ),
      home: const HomeView(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context){
//   return Scaffold(
//    body: Column(
//      children: [
//       const SizedBox(height: 40,),
//        TDButton(
//         text: 'Teste',
//         width: 300,
//         callback: (){}, 
//         image: 'assets/images/google.png',
//         ),
//         const SizedBox(height: 40,),
//         const TDAvatar(
//           path: 'https://placehold.it/200', 
//           width: 120,
//         ),
//       ],
//     ),
//   );
//  } 
// }



