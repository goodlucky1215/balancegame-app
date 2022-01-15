import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BalanceGameResult.dart';
import 'model/catalogModel.dart';

class BalanceGameStart extends StatefulWidget {
  static const routeName = '/balaceGameStart';
  @override
  State createState() {
    return GameStart();
  }
}

class GameStart extends State<BalanceGameStart> {
  int i = 0;
  var check = new List.filled(10, 0, growable: false);

  @override
  Widget build(BuildContext context) {
    final CatalogListData id =
        ModalRoute.of(context)!.settings.arguments as CatalogListData;

    return Scaffold(
        appBar: AppBar(
          title: Text(id.catalogName),
        ),
        body: Center(
            child: FutureBuilder(
                future: getQuiz('assets/' + id.catalogId.toString() + '.txt'),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> catalogQuestion) {
                  if (catalogQuestion.hasData == false) {
                    return CircularProgressIndicator();
                  }
                  final catalogQuestionList = catalogQuestion.data.toString();
                  final catalogQuestionLine = catalogQuestionList.split('\n');
                  List<List<String>> catalogQuestionLineSplit = [];
                  for (var row in catalogQuestionLine) {
                    catalogQuestionLineSplit.add(row.split('/'));
                    print(row);
                  }
                  return result(catalogQuestionLineSplit, id.catalogId);
                })));
  }

  Column result(List<List<String>> catalogQuestionLineSplit, int catalogId) {
    return (Column(children: <Widget>[
      Container(child: Text(catalogQuestionLineSplit[i][0])),
      Row(
        children: <Widget>[
          makeButton(catalogId, catalogQuestionLineSplit[i][1], 1, () => i++),
          makeButton(catalogId, catalogQuestionLineSplit[i][2], 2, () => i++),
        ],
      ),
    ]));
  }

  Future<String> getQuiz(String textPath) async {
    return await rootBundle.loadString(textPath);
  }

  Widget makeButton(
      int catalogId, String title, int choice, VoidCallback callback) {
    check[i] = choice;
    return RaisedButton(
      child: Text(title),
      onPressed: () {
        setState(() {
          if (i < 9)
            callback();
          else
            Navigator.pushNamed(context, BalanceGameResult.routeName,
                arguments: {"catalogId" : catalogId, "check" : check});
        });
      },
    );
  }
}
