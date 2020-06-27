import 'dart:async';
import 'package:flutter/material.dart';
import 'model.dart';
import 'utils.dart';
import 'node_item.dart';

class TreePage extends StatefulWidget {
  TreePage({Key key}) : super(key: key);

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  _TreePageState() {
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
        body: model == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    NodeItem(model.children[index]),
                itemCount: model.children.length,
              ));
  }
}
