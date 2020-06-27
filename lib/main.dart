import 'package:flutter/material.dart';
import 'tree_page.dart';
import 'dashboard_page.dart';
import 'settings_page.dart';
import 'utils.dart';

void main() async {
  runApp(MyApp());
  init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Hardware Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabsPageState();
  }
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TreePage(),
    DashboardPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: SizedBox.shrink(),
            ),
          ]),
    );
  }
}
