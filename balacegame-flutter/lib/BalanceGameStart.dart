import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'BalanceGameResult1.dart';
import 'model/catalogModel.dart';

var logger = Logger();

class BalanceGameStart extends StatefulWidget {
  static const routeName = '/balaceGameStart';
  @override
  State createState() {
    return GameStart();
  }
}

class GameStart extends State<BalanceGameStart> {
  int i = 0;
  var check = new List.filled(16, 0, growable: false);

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
    return (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      Container(
          child: Text(catalogQuestionLineSplit[i][0],
              style: TextStyle(
                  fontSize: 20,
                  height: 1.0
              ),
        ),
      ),
      Row(
        children: <Widget>[
          makeButton(catalogId, catalogQuestionLineSplit[i][1], 1, () => i++),
        ],
      ),
      Row(
        children: <Widget>[
          makeButton(catalogId, catalogQuestionLineSplit[i][2], 2, () => i++),
        ],
      ),
    ]
    )
    );
  }

  Future<String> getQuiz(String textPath) async {
    return await rootBundle.loadString(textPath);
  }

  Widget makeButton(int catalogId, String title, int choice, VoidCallback callback) {
    return
          TextButton(
          child: Text(title,
            style: TextStyle(
              fontSize: 20,
              height: 1.0,
            ),
          ),
          onPressed: () {
            setState(() {
              check[i] = choice;
              if (i < 15)
                callback();
              else
                Navigator.pushNamed(context, BalanceGameResult1.routeName,
                    arguments: {"catalogId" : catalogId, "check" : check});
            });
          },
        );
  }

}
