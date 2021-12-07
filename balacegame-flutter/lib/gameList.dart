import 'package:balacegame_flutter/api/balanceService.dart';
import 'package:balacegame_flutter/model/catalogModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class GameList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetGameList();
}

class WidgetGameList extends State<GameList> {
  late CatalogGetDto response;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('밸런스 게임'),
      ),
      body: getGameList(),
      );
  }

  getGameList(){
    late Widget page;
    if(!isLoading){
      page = pageIsNot();
      getBalanceGameListData();
    } else {
      page = pageIs();
    }
    return page;
  }

  getBalanceGameListData(){
    final dio = Dio();
    final client = BalanceService(dio);
    client.getBalanceGameList()
    .then((it){
      setState(() {
        response = ((it['data'] as List)[0]) as CatalogGetDto;
        isLoading = true;
      });
    });
  }

  Container pageIsNot(){
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Loading...',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  ListView pageIs(){
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(response.data[0].catalogName),
        )
      ],
    );
  }

}