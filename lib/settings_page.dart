import 'package:flutter/material.dart';
import 'connection_settings_dialog.dart';
import 'utils.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListTile(
            title: Text('Connection'),
            subtitle: Text('$address:$port'),
            leading: Icon(Icons.cloud),
            onTap: () => showDialog(
                context: context, builder: (_) => ConnectionSettingsDialog())));
  }
}
