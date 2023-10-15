abstract class ImgManager {
  static const String _pngPath = 'assets/images';
  static const String _svgPath = 'assets/svg';

  /// png
  static const String pngSplash = '$_pngPath/splash.png';
  static const String pngLogo = '$_pngPath/app_logo.png';
  static const String pngLunch = '$_pngPath/lunch.png';
  static const String pngNoNotification = '$_pngPath/no_notification.png';
  static const String pngMyLocation = '$_pngPath/my_location.png';
  static const String pngQr = '$_pngPath/qr.png';
  static const String pngMarket = '$_pngPath/market.png';
  static const deliveryDriver = "$_pngPath/delivery_driver.jpg";
  static const deliveryBusiness = "$_pngPath/delivery_business.jpg";
  static const bigHero = "$_pngPath/big_hero.jpg";
  static const pharmacyDelivery = "$_pngPath/pharmacy_delivery.png";

  // network
  // static const networkLogin =
  //     "https://movieguide.b-cdn.net/wp-content/uploads/2014/10/big_hero_six_ver3.jpg";
  static const totLogo = "$_pngPath/tot_logo.png";
  static const defaultProfileImg = "https://i.stack.imgur.com/l60Hf.png";

  /// svg
  static const String svgBalance = '$_svgPath/balance.svg';
  static const svgDefaultProfileImg = '$_svgPath/balance.svg';

  static const String svgCutter = '$_svgPath/cutter.svg';
}

abstract class LottieManager {
  static const _path = "assets/lottie";

  static const emptyBox = "$_path/empty-box.json";
}
