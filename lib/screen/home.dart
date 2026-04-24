
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_call/model/user.dart' show User, UserName;
import 'package:flutter_rest_api_call/services/user_api.dart';
import 'package:http/http.dart';


class HomeScree extends StatefulWidget {
  const HomeScree({super.key});

  @override
  State<HomeScree> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScree> {
  List<User> users = [];

  @override
  void initState(){
     super.initState();
     fetchUsers(); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          final user = users[index];
          //final color = user.gender == 'male' ? Colors.amber :Colors.blueGrey;
          return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              //tileColor: color,
          );
        }
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      //   ),
    );
  }

  Future<void> fetchUsers() async{
   final response = await UserApi.fetchUsers();
   setState(() {
     users = response;
   });
  }

  // Future<void> fetchUsers() async{
  //   print('FetchUsers Called');
  //   const url= 'https://randomuser.me/api/?results=100';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map((e){
  //     final name = UserName(
  //       title: e['name'] ['title'], 
  //       first: e['name'] ['first'], 
  //       last: e['name'] ['last'],
  //       );
  //       return User(
  //         cell: e['cell'],
  //         email: e['email'],
  //         gender: e['gender'],
  //         nat: e['nat'],
  //         phone: e['phone'],
  //         name: name,
  //       );
  //     }).toList();
  //   setState(() {
  //     //users = json['results'];
  //     users = transformed;
  //   });
  //   print('FetchUsers Completed');
  // }
}