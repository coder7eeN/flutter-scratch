import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';

void main() {
  // 1
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  // TODO: Setup default theme

  // 2
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  // TODO: Add changeTheme above here
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    // TODO: Setup default theme

    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      // TODO: Add theme
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      // TODO: Apply Home widget
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      ),

      // 4
      // home: Scaffold(
      //   appBar: AppBar(
      //     // TODO: Add action buttons
      //     actions: [
      //       ThemeButton(
      //         changeThemeMode: changeThemeMode,
      //       ),
      //       ColorButton(
      //         changeColor: changeColor,
      //         colorSelected: colorSelected,
      //       ),
      //     ],
      //     elevation: 4.0,
      //     title: const Text(
      //       appTitle,
      //       style: TextStyle(fontSize: 24.0),
      //     ),
      //   ),
      //   body: const Center(
      //     child: Text(
      //       'You Hungry?😋',
      //       style: TextStyle(fontSize: 30.0),
      //     ),
      //   ),
      // ),
    );
  }
}
