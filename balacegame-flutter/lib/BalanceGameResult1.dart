import 'package:balacegame_flutter/GameList1.dart';
import 'package:balacegame_flutter/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BalanceGameResult1 extends StatefulWidget {
  static const routeName = '/balanceGameResult1';
  @override
  State createState() {
    return GameResult();
  }
}
class GameResult extends State<BalanceGameResult1> {
  static const routeName = '/balanceGameResult1';
  BannerAd? _bannerAd;

  InterstitialAd? _interstitialAd;

  //배너 광고
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

    //전면 광고
    _loadInterstitialAd();

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
             // Navigator.of(context).pushNamed(GameList1.routeName);
              //_loadInterstitialAd();
              Navigator.pop(context);
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextButton(
                  child: const Text(
                    '다른 밸런스 게임 하러가기',
                    style: TextStyle(
                        fontSize: 20,
                        height: 1.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    if (_interstitialAd != null) {
                      _interstitialAd?.show();
                    } else {
                      Navigator.of(context).pushNamed(GameList1.routeName);
                    }
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right_alt_outlined),
                color: Theme.of(context).primaryColor,
                iconSize: 50,
                onPressed: () {
                 // if (_interstitialAd != null) {
                 //   _interstitialAd?.show();
                //  } else {
                   // Navigator.of(context).pushNamed(GameList1.routeName);
                    Navigator.pop(context);
                //  }
                },
              ),
              SizedBox(height: 40.0,),
              if (_bannerAd!= null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _bannerAd?.size.width.toDouble(),
                    height: _bannerAd?.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
                ),
            ],
          )
      ),
    );
  }
}
