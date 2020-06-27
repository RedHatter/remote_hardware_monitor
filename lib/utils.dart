import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';

String address;
String port;

SharedPreferences sharedPreferences;
Future<void> init() async {
  sharedPreferences = await SharedPreferences.getInstance();
  address = sharedPreferences.getString('server_address');
  port = sharedPreferences.getString('server_port') ?? '8085';
}

void updateConnection({String address, String port}) {
  sharedPreferences.setString('server_address', address);
  sharedPreferences.setString('server_port', port);
}

Future<Node> request() async {
  if (address == null || port == null) return null;

  final response = await get('http://$address:$port/data.json');

  if (response.statusCode != 200)
    throw Exception('Failed to connect to Open Hardware Monitor.');

  return Node.fromJson(json.decode(response.body));
}

String requiredValidator(String value) {
  return value.isEmpty ? 'This field is required.' : null;
}

String getImageUrl(path) => 'http://$address:$port/$path';
