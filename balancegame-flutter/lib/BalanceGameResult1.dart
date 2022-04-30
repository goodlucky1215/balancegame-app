import 'package:balancegame_flutter/GameList1.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BalanceGameResult1 extends StatelessWidget {
  static const routeName = '/balanceGameResult1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextButton(
                  child: const Text(
                    '다른 밸런스 게임 하러가기',
                    style: TextStyle(
                        fontSize: 20,
                        height: 1.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(GameList1.routeName);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right_alt_outlined),
                color: Theme.of(context).primaryColor,
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).pushNamed(GameList1.routeName);
                },
              ),
            ],
          )
      ),
    );
  }

}
