import 'dart:async';
import 'package:flutter/material.dart';
import 'utils.dart';
import 'model.dart';
import 'widget_config_page.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  _DashboardPageState() {
    timer = Timer.periodic(new Duration(seconds: 1), update);
  }

  Timer timer;
  Node model;

  void update(Timer _) async {
    final node = await request();
    setState(() => model = node);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Remote Hardware Monitor'),
        ),
        body: Text('dashboard'),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => WidgetConfigPage(model: model))),
          tooltip: 'New Widget',
          child: Icon(Icons.add),
        ));
  }
}
