import 'package:balacegame_flutter/api/balanceService.dart';
import 'package:balacegame_flutter/model/catalogModel.dart';
import 'package:balacegame_flutter/providers/Statistics.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'BalanceGameStart.dart';

var logger = Logger();

class GameList extends StatefulWidget {
  static const routeName = '/';
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

  getGameList() {
    late Widget page;
    if (!isLoading) {
      page = pageIsNot();
      getBalanceGameListData();
    } else {
      page = pageIs();
    }
    return page;
  }

  getBalanceGameListData() {
    final dio = Dio();
    final client = BalanceService(dio);
    client.getBalanceGameList().then((it) {
      setState(() {
        response = it;
        isLoading = true;
      });
    });
  }

  Container pageIsNot() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Loading...',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  ListView pageIs() {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: response.data.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: Column(children: <Widget>[
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.width * 0.30,
              child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text(response.data[index].catalogName),
                  onPressed: () {
                    Provider.of<Statistics>(context, listen: false)
                        .setCatalogData(response.data[index]);
                    Navigator.pushNamed(context, BalanceGameStart.routeName,
                        arguments: response.data[index]);
                  }),
            )
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
