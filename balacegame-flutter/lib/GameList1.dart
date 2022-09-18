import 'package:balacegame_flutter/api/balanceService.dart';
import 'package:balacegame_flutter/model/catalogModel.dart';
import 'package:balacegame_flutter/providers/Statistics.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'BalanceGameStart.dart';
import 'ad_helper.dart';
var logger = Logger();

class GameList1 extends StatefulWidget {
  static const routeName = '/';
  @override
  State<StatefulWidget> createState() => WidgetGameList();
}

class WidgetGameList extends State<GameList1> {
  List<CatalogListData> catalogList = <CatalogListData>[];
  List<String> gameName = ["가벼운 밸런스 게임","웃긴 밸런스 게임","연애 밸런스 게임"];

  InterstitialAd? _interstitialAd;

  var _index;

  @override
  void initState(){
    super.initState();

    _loadInterstitialAd();

    var bundle = DefaultAssetBundle.of(context);
    bundle.loadString('asset/configure.json');
    for(int i=1;i<=3;i++){
      catalogList.add(new CatalogListData(catalogName: gameName[i-1], catalogId: i));
    }
  }

  //전면 광고
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Provider.of<Statistics>(context, listen: false)
                  .setCatalogData(catalogList[_index]);
              Navigator.pushNamed(context, BalanceGameStart.routeName,
                  arguments: catalogList[_index]);
              _loadInterstitialAd();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _interstitialAd?.dispose();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('밸런스 게임'),
      ),
      body: Container(
        child: gameListView(context),

      )

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
                    if (_interstitialAd != null) {
                      _index = index;
                     _interstitialAd?.show();
                    } else {
                      Provider.of<Statistics>(context, listen: false)
                          .setCatalogData(catalogList[index]);
                      Navigator.pushNamed(context, BalanceGameStart.routeName,
                          arguments: catalogList[index]);
                    }
                  }),

            ),
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }



}
