import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/pages/settings_page.dart';
import 'package:todo_flutter/pages/todos_page.dart';

class BottomTabNavigation extends StatefulWidget {
  const BottomTabNavigation({super.key});

  @override
  State<BottomTabNavigation> createState() => _BottomTabNavigationState();
}

class _BottomTabNavigationState extends State<BottomTabNavigation> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home), label: "Todos"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: "Settings"),
      ]),
      tabBuilder: (context, index) {
        var title = index == 0 ? "Todos" : "Settings";
        var page = switch (index) {
          0 => const TodosPage(),
          1 => const SettingsPage(),
          _ => const Text("Error, something went wrong")
        };

        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(middle: Text(title)),
              child: SafeArea(top: true, child: page));
        });
      },
    );
  }
}
