import 'package:balancegame_flutter/api/balanceService.dart';
import 'package:balancegame_flutter/model/catalogModel.dart';
import 'package:balancegame_flutter/providers/Statistics.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'BalanceGameStart.dart';
var logger = Logger();

class GameList1 extends StatefulWidget {
  static const routeName = '/';
  @override
  State<StatefulWidget> createState() => WidgetGameList();
}

class WidgetGameList extends State<GameList1> {
  List<CatalogListData> catalogList = <CatalogListData>[];
  List<String> gameName = ["가벼운 밸런스 게임","웃긴 밸런스 게임","연애 밸런스 게임"];

  @override
  void initState(){
    super.initState();
    var bundle = DefaultAssetBundle.of(context);
    bundle.loadString('asset/configure.json');
    for(int i=1;i<=3;i++){
      catalogList.add(new CatalogListData(catalogName: gameName[i-1], catalogId: i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('밸런스 게임'),
      ),
      body: Center(child: gameListView(context)),
    );
  }

  Widget gameListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: catalogList.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: Column(children: <Widget>[
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.width * 0.30,
              child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text(catalogList[index].catalogName),
                  onPressed: () {
                    Provider.of<Statistics>(context, listen: false)
                        .setCatalogData(catalogList[index]);
                    Navigator.pushNamed(context, BalanceGameStart.routeName,
                        arguments: catalogList[index]);
                  }),
            )
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }



}
