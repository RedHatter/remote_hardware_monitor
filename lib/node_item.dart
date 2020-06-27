import 'package:flutter/material.dart';
import 'model.dart';
import 'utils.dart';

class NodeItem extends StatelessWidget {
  const NodeItem(this.node);

  final Node node;

  @override
  Widget build(BuildContext context) {
    if (node.children.isEmpty)
      return ListTile(
          title: Row(children: [
        Expanded(flex: 3, child: Text(node.text)),
        Expanded(flex: 2, child: Text(node.min)),
        Expanded(flex: 2, child: Text(node.value)),
        Expanded(flex: 2, child: Text(node.max))
      ]));

    final children =
        node.children.map<Widget>((child) => NodeItem(child)).toList();
    if (node.children[0].children.isEmpty)
      children.insert(
          0,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                Spacer(flex: 3),
                Expanded(
                    flex: 2,
                    child: Text('Min',
                        style: Theme.of(context).textTheme.caption)),
                Expanded(
                    flex: 2,
                    child: Text('Value',
                        style: Theme.of(context).textTheme.caption)),
                Expanded(
                    flex: 2,
                    child:
                        Text('Max', style: Theme.of(context).textTheme.caption))
              ])));
    return ExpansionTile(
      key: PageStorageKey<int>(node.id),
      leading: Image.network(getImageUrl(node.imageURL)),
      title: Text(node.text),
      children: children,
    );
  }
}
