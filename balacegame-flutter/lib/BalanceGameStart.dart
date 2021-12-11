import 'package:flutter/material.dart';

import 'model/catalogModel.dart';

class BalanceGameStart extends StatelessWidget {
const BalanceGameStart({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  final Object? id = ModalRoute.of(context).settings.arguments;
  return Scaffold(
    appBar: AppBar(
      title: Text('이건 B'),
    ),
    body: Center(
      child: Text(id!.catalogId),
    ),
  );
}
}
