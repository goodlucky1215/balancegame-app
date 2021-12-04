import 'package:balacegame_flutter/api/balanceService.dart';
import 'package:balacegame_flutter/model/catalogGetDto.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class GameList extends StatelessWidget{
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    final balanceList = BalanceService(dio);

    return Scaffold(
      appBar: AppBar(
        title: Text('밸런스 게임'),
      ),
      body: Center(
        child: FutureBuilder<CatalogGetDto?>(

        ),
      )
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