import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'BalanceGameResult1.dart';
import 'model/catalogModel.dart';

var logger = Logger();

final BannerAd _banner = BannerAd(
    adUnitId: '',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    )
)..load();

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
          Container(
            alignment: Alignment.bottomCenter,
            child: AdWidget(ad: _banner,),
            width: _banner.size.width.toDouble(),
            height: _banner.size.height.toDouble(),
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
