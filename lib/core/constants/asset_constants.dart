class AppAssets {
  static final AppAssets _instance = AppAssets._();
  AppAssets._();
  static AppAssets get instance => _instance;

  //path constants
  static const _assetsImagePath = "assets/images/";

  // images
  final loadingImage = '${_assetsImagePath}loading.gif';
}
