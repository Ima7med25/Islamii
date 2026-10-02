String removeBasmalah(String text) {
  const String basmalah = 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ';
  final String normalizedText = text.replaceAll(RegExp(r'\s+'), ' ').trim();
  if (normalizedText.startsWith(basmalah)) {
    return normalizedText.substring(basmalah.length).trim();
  }
  return text.trim();
}

String removeDiacritics(String text) {
  const diacritics = [
    '\u064B',
    '\u064C',
    '\u064D',
    '\u064E',
    '\u064F',
    '\u0650',
    '\u0651',
    '\u0652',
  ];
  for (var diacritic in diacritics) {
    text = text.replaceAll(RegExp(diacritic), '');
  }
  return text;
}
