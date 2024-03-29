import 'dart:io';

class AdHelper {


  //배너
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6244095830403956/9210711776';
      //return 'ca-app-pub-3940256099942544/6300978111'; //테스트
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  //전면
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6244095830403956/3657853722";
      //return "ca-app-pub-3940256099942544/1033173712"; //테스트
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
/*
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

 */
}