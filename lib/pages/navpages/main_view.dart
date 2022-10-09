import 'package:flutter/material.dart';

import 'bar_item_view.dart';
import '../home_view.dart';
import 'profile_view.dart';
import 'search_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPaveViewState();
}

class _MainPaveViewState extends State<MainPageView> {
  List pages = const [
    HomeView(),
    BarItemView(),
    SearchView(),
    ProfileView(),
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentindex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: 'Bar',
              icon: Icon(Icons.bar_chart_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Ptofile',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
