import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/constants/color.dart';
import 'package:stomasys/gradovi/gradovi_screen.dart';

import '../../components/custom_appBar.dart';
import 'logout_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  HomeScreenState();

  final List<Widget> tabs = [
    // Define your tabs here
    // Example: Tab1(), Tab2(), Tab3(), Tab4()
    GradoviScreen(),
    LogOutScreen(),
    LogOutScreen(),
    LogOutScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex], // Display the selected tab
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConstants.primaryBackgroundColor,
        backgroundColor: ColorConstants.primaryBlue,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home),
            label: 'Cities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Tab 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tab 4',
          ),
        ],
      ),
    );
  }
}
