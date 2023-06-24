class AssetSVG {
  const AssetSVG._();
  static String _svgPath(String name) {
    return 'assets/svg/$name.svg';
  }

  static final kAddNote = _svgPath('add_note');
}
