import 'package:flutter/material.dart';
import 'package:untitled/controllers/bottom_navigation_bar_conroller.dart';
import 'package:untitled/controllers/notes_controller.dart';
import 'package:untitled/controllers/theme_controller.dart';
import 'package:untitled/ui/pages/main_page.dart';
import 'package:untitled/ui/theme/mytheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<ThemeMode> _themeList = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarController()),
        ChangeNotifierProvider(create: (_) => NotesController()),
        ChangeNotifierProvider(create: (_) => ThemeController())
      ],
      child:
          Consumer<ThemeController>(builder: (context, themeController, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.myTheme,
          darkTheme: MyTheme.myDarkTheme,
          themeMode: _themeList[themeController.getThemeIndex],
          home: MainPage(),
        );
      }),
    );
  }
}
