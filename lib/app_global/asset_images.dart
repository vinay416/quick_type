class AssetImages {
  const AssetImages._();
  static String _imagePath(String name) {
    return 'assets/images/$name.png';
  }

  static final kForwardArrow = _imagePath('forward-arrow');
}
