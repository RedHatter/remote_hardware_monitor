import 'package:flutter/material.dart';
import 'utils.dart';
import 'model.dart';

class SensorDialog extends StatelessWidget {
  SensorDialog({Key key, this.model}) : super(key: key);

  final Node model;

  List<Widget> expandNode(BuildContext context, Node node, {int depth = 0}) =>
      node.children.isEmpty
          ? [
              SimpleDialogOption(
                padding: EdgeInsets.only(
                    top: 8.0,
                    right: 24.0,
                    bottom: 8.0,
                    left: 24.0 + 12.0 * depth),
                onPressed: () => Navigator.pop(context, node.id),
                child: Text(node.text),
              )
            ]
          : [
              Padding(
                  padding: EdgeInsets.only(
                      top: 8.0,
                      right: 24.0,
                      bottom: 8.0,
                      left: 24.0 + 12.0 * depth),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Image.network(getImageUrl(node.imageURL))),
                    Text(node.text,
                        style: Theme.of(context).textTheme.subtitle2)
                  ])),
              ...node.children
                  .expand((node) => expandNode(context, node, depth: depth + 1))
            ];

  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: const Text('Sensor'),
        children: model.children[0].children
            .expand((node) => expandNode(context, node))
            .toList(),
      );
}
