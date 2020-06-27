class Node {
  final int id;
  final String text;
  final List<Node> children;
  final String min;
  final String value;
  final String max;
  final String imageURL;

  Node(
      {this.id,
      this.text,
      this.children,
      this.min,
      this.value,
      this.max,
      this.imageURL});

  Node.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        text = json['Text'] as String,
        children = (json['Children'] as List)
            .map((e) => Node.fromJson(e as Map<String, dynamic>))
            .toList(),
        min = (json['Min'] as String).replaceAll('\u00C2', ''),
        value = (json['Value'] as String).replaceAll('\u00C2', ''),
        max = (json['Max'] as String).replaceAll('\u00C2', ''),
        imageURL = json['ImageURL'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'Text': text,
        'Children': children,
        'Min': min,
        'Value': value,
        'Max': max,
        'ImageURL': imageURL,
      };
}
