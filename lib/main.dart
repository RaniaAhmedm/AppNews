import 'package:app_news/home-screen.dart';
import 'package:flutter/material.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        routes: {
          HomeScreen.routeName:(context)=>HomeScreen(),
        },
        initialRoute:HomeScreen.routeName ,
      );
  }
}
