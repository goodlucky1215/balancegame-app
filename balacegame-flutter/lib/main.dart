import 'package:balacegame_flutter/BalanceGameStart.dart';
import 'package:flutter/material.dart';
import 'package:balacegame_flutter/gameList.dart';

import 'BalanceGameResult.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => GameList(),
        '/balanceGameStart' : (context) => BalanceGameStart(),
        BalanceGameResult.routeName: (ctx) => BalanceGameResult(),
      },
    );
  }
}

