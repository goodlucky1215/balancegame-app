import 'package:balacegame_flutter/GameList.dart';
import 'package:balacegame_flutter/StatisticsScreen.dart';
import 'package:flutter/material.dart';

class BalanceGameResult extends StatelessWidget {
  static const routeName = '/balanceGameResult';

  @override
  Widget build(BuildContext context) {
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
}
