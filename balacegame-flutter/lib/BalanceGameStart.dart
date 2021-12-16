import 'package:flutter/material.dart';
import 'model/catalogModel.dart';


class BalanceGameStart extends StatefulWidget {
  const BalanceGameStart({Key? key}) : super(key: key);
  @override
  GameStart createState() => GameStart();
}

class GameStart extends State<BalanceGameStart> {

  @override
  Widget build(BuildContext context) {
    final CatalogListData id = ModalRoute.of(context)!.settings.arguments as CatalogListData;
    return Scaffold(
      appBar: AppBar(
        title: Text(id.catalogName),
      ),
      body: getQuiz('assets/'+id.catalogId.toString()+'.txt'),
    );
  }

  getQuiz(String txtFile) {
    var bundle = DefaultAssetBundle.of(context);
    var a = bundle.loadString(txtFile).asStream();

    final contents = bundle.toString();
    // 개행 단위로 분리(한줄씩 자르는 거임)
    //final rows = contents.split('\n');
    // 이번 파일에서 구분 문자는 (/)
    //var cols = rows[2].split('/');
    print(a.);
  }

}

