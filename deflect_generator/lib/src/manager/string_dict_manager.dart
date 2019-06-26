import 'dart:convert';

/// collected and assign id to strings, so we can save space for user
class StringDictManager {
  /// indicates next id
  static int _id = 0;

  /// string dict that holds string and it's id
  static Map<String, int> _stringDict = {};

  /// register string
  static int registerString(String str) {
    if (!_stringDict.containsKey(str)) {
      _stringDict[str] = _id;
      _id++;
    }
    return _stringDict[str];
  }

  /// defensive copy
  static Map<String, int> getDict() => Map.from(_stringDict);

  static String getTemplate() => "const sd = ${json.encode(_stringDict.keys.toList())};";
}
