import 'package:flutter/material.dart';
import 'package:m2_lesson9/screens/home/login_page.dart';
import 'package:m2_lesson9/screens/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BottomMenu _currentTab = BottomMenu.home;

  void _selectTab(BottomMenu tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTab.index,
        children: [LoginPage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab.index,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        // showUnselectedLabels: true,
        onTap: (index) {
          _selectTab(BottomMenu.values[index]);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

enum BottomMenu { home, profile }
