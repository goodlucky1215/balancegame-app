import 'package:balancegame_flutter/BalanceGameStart.dart';
import 'package:balancegame_flutter/GameList1.dart';
import 'package:balancegame_flutter/StatisticsScreen.dart';
import 'package:balancegame_flutter/providers/statistics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BalanceGameResult1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          GameList1.routeName: (context) => GameList1(), //DB가 없는 경우
          // GameList.routeName: (context) => GameList(), //DB가 있는 경우
          BalanceGameStart.routeName : (context) => BalanceGameStart(),
          BalanceGameResult1.routeName: (context) => BalanceGameResult1(), //DB가 없는 경우
          //BalanceGameResult.routeName: (context) => BalanceGameResult(), //DB가 있는 경우
          StatisticsScreen.routeName: (context) => StatisticsScreen(),
        },
      );
  }
}
