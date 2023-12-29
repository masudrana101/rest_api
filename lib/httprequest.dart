import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load posts');
  }
}



