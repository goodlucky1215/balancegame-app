import 'package:balacegame_flutter/BalanceGameStart.dart';
import 'package:balacegame_flutter/GameList1.dart';
import 'package:balacegame_flutter/StatisticsScreen.dart';
import 'package:balacegame_flutter/providers/Statistics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BalanceGameResult.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Statistics()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          GameList1.routeName: (context) => GameList1(), //DB가 없는 경우
          // GameList.routeName: (context) => GameList(), //DB가 있는 경우
          BalanceGameStart.routeName : (context) => BalanceGameStart(),
          BalanceGameResult.routeName: (context) => BalanceGameResult(),
          StatisticsScreen.routeName: (context) => StatisticsScreen(),
        },
      ),
    );
  }
}
