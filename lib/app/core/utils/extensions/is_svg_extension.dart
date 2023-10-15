extension IsSvgExtension on String? {
  bool isSvg() {
    if (this == null || this!.isEmpty) {
      return false;
    }
    final length = this!.length;
    return this!.substring(length - 3, length) == 'svg';
  }
}
