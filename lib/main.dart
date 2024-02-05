import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/bottom_tab_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: BottomTabNavigation(),
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.activeBlue,
      ),
      title: 'Hello',
    );
  }
}
