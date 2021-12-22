import 'package:flutter/material.dart';

class BalanceGameResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final check = ModalRoute
        .of(context)!
        .settings
        .arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: Text('이건 C'),
      ),
      body: Center(
        child: Text(check[0].toString()+" "+check[9].toString()),
      ),
    );
  }
}
