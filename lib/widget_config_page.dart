import 'package:flutter/material.dart';
import 'model.dart';
import 'sensor_dialog.dart';

class WidgetConfigPage extends StatefulWidget {
  WidgetConfigPage({Key key, this.model}) : super(key: key);

  final Node model;

  @override
  _WidgetConfigPageState createState() => _WidgetConfigPageState();
}

class _WidgetConfigPageState extends State<WidgetConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Config'),
        ),
        body: ListTile(
            title: Text('Sensor'),
            onTap: () => showDialog(
                context: context,
                builder: (_) => SensorDialog(model: widget.model))));
  }
}
