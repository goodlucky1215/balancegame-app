import 'dart:convert';

import 'package:balacegame_flutter/GameList.dart';
import 'package:balacegame_flutter/StatisticsScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'api/balanceService.dart';

var logger = Logger();

class BalanceGameResult extends StatelessWidget {
  static const routeName = '/balanceGameResult';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int catalogId = args['catalogId'];
    List check = args['check'];
    logger.d("catalogId => " + catalogId.toString());
    logger.d("choice number => " + check.toString());
    StatisticsDto statisticsDto = new StatisticsDto(catalogId, check);
    insertStatistics(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 160, bottom: 60),
            child: const Text(
              '다른 사람이 나를 얼마나\n맞추는지 알아보고 싶다면?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            iconSize: 50,
            color: Colors.grey,
            onPressed: () {},
          ),
          TextButton(
            child: const Text('공유하기'),
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 40),
            child: ElevatedButton(
              child: const Text(
                '통계 보러 가기',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                primary: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(StatisticsScreen.routeName);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextButton(
                  child: const Text(
                    '다른 밸런스 게임 하러가기',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(GameList.routeName);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right_alt_outlined),
                color: Theme.of(context).primaryColor,
                iconSize: 40,
                onPressed: () {
                  Navigator.of(context).pushNamed(GameList.routeName);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  //통계에 값 저장
  void insertStatistics(Map<String, dynamic> args){
    String json = jsonEncode(args);
    final dio = Dio();
    final client = BalanceService(dio);
    client.insertBalanceGameStatistics(json).then((it) {
      logger.d("insertStatistics Result => " + it.toString());
    });
  }


}

class StatisticsDto {
  var catalogId;
  var choice = 0;
  var catalog;
  var result1;
  var result2;
  var result3;
  var result4;
  var result5;
  var result6;
  var result7;
  var result8;
  var result9;
  var result10;
  var result11;
  var result12;
  var result13;
  var result14;
  var result15;
  var result16;
  StatisticsDto(int catalogId, List check){
    this.catalogId = catalogId;
    this.result1 = check[0];
    this.result2 = check[1];
    this.result3 = check[2];
    this.result4 = check[3];
    this.result5 = check[4];
    this.result6 = check[5];
    this.result7 = check[6];
    this.result8 = check[7];
    this.result9 = check[8];
    this.result10 = check[9];
    this.result11 = check[10];
    this.result12 = check[11];
    this.result13 = check[12];
    this.result14 = check[13];
    this.result15 = check[14];
    this.result16 = check[15];
  }
}
