import 'package:flutter/material.dart';

import 'bar_item_view.dart';
import 'home_view.dart';
import 'profile_view.dart';
import 'search_view.dart';

class MainPaveView extends StatefulWidget {
  const MainPaveView({super.key});

  @override
  State<MainPaveView> createState() => _MainPaveViewState();
}

class _MainPaveViewState extends State<MainPaveView> {
  List pages = const [
    HomeView(),
    BarItemView(),
    SearchView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.apps),
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            label: 'Bar',
            icon: Icon(Icons.bar_chart_sharp),
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            label: 'Ptofile',
            icon: Icon(Icons.person),
            backgroundColor: Colors.black),
      ]),
    );
  }
}
//52:23
