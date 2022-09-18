import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'BalanceGameResult1.dart';
import 'ad_helper.dart';
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
  var check = new List.filled(16, 0, growable: false);

  BannerAd? _bannerAd;

  @override
  void initState() {

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;

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
                  return result(catalogQuestionLineSplit, id.catalogId, width);
                })));
  }

  Column result(List<List<String>> catalogQuestionLineSplit, int catalogId, double width) {
    return (
        Column(
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

          SizedBox(height: 50.0,),
      Row(
    mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          makeButton(catalogId, catalogQuestionLineSplit[i][1], 1, width, () => i++),
        ],
      ),
          SizedBox(height: 30.0,),
      Row(
    mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          makeButton(catalogId, catalogQuestionLineSplit[i][2], 2, width, () => i++),
        ],
      ),
          SizedBox(height: 20.0,),
          if (_bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _bannerAd?.size.width.toDouble(),
                height: _bannerAd?.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
    ]
    )
    );
  }

  Future<String> getQuiz(String textPath) async {
    return await rootBundle.loadString(textPath);
  }

  Widget makeButton(int catalogId, String title, int choice, double width, VoidCallback callback) {
    return
          TextButton(
          child: Text(title),
            style: TextButton.styleFrom(
              minimumSize: Size(240, 200),
              backgroundColor: Colors.lightBlueAccent,
              primary: Colors.white, // foreground
              textStyle: TextStyle(fontSize: 20),
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
