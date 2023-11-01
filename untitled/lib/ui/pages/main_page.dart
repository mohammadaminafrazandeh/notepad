import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/controllers/bottom_navigation_bar_conroller.dart';
import 'package:untitled/controllers/theme_controller.dart';
import 'package:untitled/ui/pages/home_page.dart';
import 'package:untitled/ui/pages/add_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Widget> _pages = [
    HomePage(),
    AddPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarController>(
        builder: (context, bottomNavBar, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notepad',
            style: TextStyle(color: Colors.teal[700]),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ThemeController>().setThemeIndex(1);
                },
                icon: const Icon(Icons.sunny)),
            IconButton(
                onPressed: () {
                  context.read<ThemeController>().setThemeIndex(2);
                },
                icon: const Icon(Icons.nightlight_round_rounded))
          ],
        ),
        //
        bottomNavigationBar: myBottomNavBar(
          currentIndex: bottomNavBar.getCurrentIndex,
          setIndex: bottomNavBar.setTabIndex,
        ),
        body: _pages.elementAt(bottomNavBar.getCurrentIndex),
      );
    });
  }

  BottomNavigationBar myBottomNavBar(
      {required int currentIndex, required Function setIndex}) {
    return BottomNavigationBar(
      onTap: (index) {
        setIndex(index);
      },
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'add'),
      ],
    );
  }
}
