class AssetImages {
  const AssetImages._();
  static String _imagePath(String name) {
    return 'assets/images/$name.png';
  }

  static final kMoon = _imagePath('moon');
  static final kSun = _imagePath('sun');
  static final kForwardArrow = _imagePath('forward-arrow');
}
