import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/provider/demo_provider.dart';
import 'package:using_provider/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(create: (_)=> CountProvider(),child: MaterialApp(home: HomeScreen()));
    // return MultiProvider(providers: [
    //   ChangeNotifierProvider(create: (_) => CountProvider()),
    //   ChangeNotifierProvider(create: (_) => CountProvider(),)
    // ],child: MaterialApp(home: HomeScreen()));
  }
}



