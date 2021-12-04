import 'package:flutter/material.dart';
import 'package:balacegame_flutter/gameList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => GameList(),
      },
    );
  }
}


