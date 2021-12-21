import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/catalogModel.dart';


class BalanceGameStart extends StatefulWidget {
  @override
  State createState() {
    return GameStart();
  }
}

class GameStart extends State<BalanceGameStart> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final CatalogListData id = ModalRoute
        .of(context)!
        .settings
        .arguments as CatalogListData;

    return Scaffold(
      appBar: AppBar(
        title: Text(id.catalogName),
      ),
      body: Center(
        child: FutureBuilder(
          future:getQuiz('assets/'+id.catalogId.toString()+'.txt'),
          builder: (BuildContext context, AsyncSnapshot<dynamic> catalogQuestion) {
            final catalogQuestionList = catalogQuestion.data.toString();
            final catalogQuestionLine = catalogQuestionList.split('\n');
            List<List<String>> catalogQuestionLineSplit = [];
            for (var row in catalogQuestionLine) {
              catalogQuestionLineSplit.add(row.split('/'));
              print(row);
            }
            return result(catalogQuestionLineSplit);
          }))
    );
  }

      Column result(List<List<String>> catalogQuestionLineSplit){
            return (Column(
                children: <Widget>[
                Container(
                    child: Text(catalogQuestionLineSplit[i][0])
                ),
                Row(
                  children: <Widget>[
                    makeButton(catalogQuestionLineSplit[i][1],()=>i++),
                    makeButton(catalogQuestionLineSplit[i][2],()=>i++),
                  ],
                ),
                ])
            );
          }

  Future<String> getQuiz(String textPath) async{
    return await rootBundle.loadString(textPath);
  }
  Widget makeButton(String title, VoidCallback callback) {
    return RaisedButton(
      child: Text(title),
      onPressed: () {
        setState(() {
          callback();
        });
      },
    );
  }

}
