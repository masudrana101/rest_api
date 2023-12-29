import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:rest_api/screen/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo API in Flutter'),
        ),


        body: FutureBuilder<List<dynamic>>(
          // Specify the type of data FutureBuilder expects

          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            else if (snapshot.hasData) {
              // Display the data in a ListView, for example
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]['title']),
                    subtitle: Text(snapshot.data![index]['body']),
                  );
                },
              );
            }
            else {
              return Text('No data');
            }
          },
        ),





      ),
    );
  }
}


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


