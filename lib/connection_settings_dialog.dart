import 'package:flutter/material.dart';
import 'utils.dart';

class ConnectionSettingsDialog extends StatefulWidget {
  ConnectionSettingsDialog({Key key}) : super(key: key);

  @override
  _ConnectionSettingsDialogState createState() =>
      _ConnectionSettingsDialogState();
}

class _ConnectionSettingsDialogState extends State<ConnectionSettingsDialog> {
  final _formKey = GlobalKey<FormState>();
  String _address;
  String _port;

  void submit() async {
    final form = _formKey.currentState;
    if (!form.validate()) return;

    form.save();
    updateConnection(address: _address, port: _port);

    Navigator.of(context).pop();
  }

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text('Connection'),
      content: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: address,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: requiredValidator,
                  onSaved: (val) => _address = val,
                ),
                TextFormField(
                  initialValue: port,
                  decoration: const InputDecoration(labelText: 'Port'),
                  validator: requiredValidator,
                  onSaved: (val) => _port = val,
                )
              ])),
      actions: [
        FlatButton(child: Text('Done'), onPressed: submit),
        FlatButton(
            child: Text('Cancel'),
            onPressed: Navigator.of(context).pop),
      ],
    );
  }
}
