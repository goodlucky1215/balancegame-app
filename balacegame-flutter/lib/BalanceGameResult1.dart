import 'package:balacegame_flutter/GameList1.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';


final BannerAd _banner = BannerAd(
    adUnitId: '', // menifest에도 ID추가해야하는거 잊지말기
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

class BalanceGameResult1 extends StatelessWidget {
  static const routeName = '/balanceGameResult1';

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
                    Navigator.of(context).pushNamed(GameList1.routeName);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right_alt_outlined),
                color: Theme.of(context).primaryColor,
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).pushNamed(GameList1.routeName);
                },
              ),
              SizedBox(height: 40.0,),
              Container(
                alignment: Alignment.bottomCenter,
                child: AdWidget(ad: _banner,),
                width: _banner.size.width.toDouble(),
                height: _banner.size.height.toDouble(),
              ),
            ],
          )
      ),
    );
  }

}
