import 'package:flutter/material.dart';
import 'package:travel_app/pages/welcome_page.dart';

import 'pages/navpages/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPaveView());
  }
}
//WelcomePage()
// MainPaveView()

