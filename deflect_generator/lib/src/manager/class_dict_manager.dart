class ClassDictManager {
  /// indicates next id
  static int _id = 0;

  /// string dict that holds string and it's id
  static Map<int, int> _classDict = {};

  /// register class
  static int registerClass(int id) {
    if (!_classDict.containsKey(id)) {
      _classDict[id] = _id;
      _id++;
    }
    return _classDict[id];
  }

  /// defensive copy
  static Map<int, int> getDict() => Map.from(_classDict);

  /// get template
  static String getTemplate() => "const cd = [${getDict().keys.join(",")}];";
}
