import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API CALL'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async{
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

  }
}









class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}




//
class _MyAppState extends State<MyApp> {



  //now here we will define a function that will get data from Api
  // we will use json placeholder
  //https://jsonplaceholder.typicode.com/comments

  var api="https://jsonplaceholder.typicode.com/comments";

//now creat function

  var data = [];

  void getDataFromApi()async{
    var response =await http.get(Uri.parse(api));

    data=jsonDecode(response.body);
    setState(() {

    });

  }



  @override

  void initState(){
    super.initState();
    getDataFromApi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api in Flutter"),

      ),
      body: ListView.builder(
          itemCount: data.length ,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(data[index]["name"]),
              subtitle: Text(data[index]["email"]),
            );

          }),
    );
  }
}
