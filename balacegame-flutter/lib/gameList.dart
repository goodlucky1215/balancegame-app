import 'package:balacegame_flutter/api/balanceService.dart';
import 'package:balacegame_flutter/model/catalogGetDto.dart';
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
      page = page0();
      getData();
    } else {
      page = page1();
    }
    return page;
  }

  getGameList1(){
    final dio = Dio();
    final client = BalanceService(dio);
    client.getUser()
  }

  ListView page1(){
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(response.),
        )
      ],
    );
  }

}

//게임 목록 가져오기
void gameListGetHttp() async{
  var dio = Dio(
    BaseOptions(
        connectTimeout : 5000,
        receiveTimeout : 3000
    )
  );
  var response;
  try{
    response = await dio.get('http://10.0.2.2:9090/api/1.0/catalogs');
  } catch(e){
   logger.d("gameListGetHttp =====> "+e.toString());
  }
  print(response);
}