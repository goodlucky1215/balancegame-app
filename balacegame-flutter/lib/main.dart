import 'package:flutter/material.dart';
import 'package:balacegame_flutter/gameList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/gameList',
      routes: {
        'gameList' : (context) => GameList()
      },
    );
  }
}


