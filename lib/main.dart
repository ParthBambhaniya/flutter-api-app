import 'package:flutter/material.dart';
import 'package:flutter_rest_api_call/screen/home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? Key}) : super(key: Key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomeScree(),
    );
  }
}
