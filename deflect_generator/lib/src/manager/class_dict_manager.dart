class ClassDictManager {
  /// indicates next id
  static int _id = 0;

  static Map<int, String> _classImportDict = {};

  /// string dict that holds string and it's id
  static Map<int, int> _classIdDict = {};

  static Map<int, String> _classNameDict = {};

  /// register class
  static int registerClass(int classId, String className, String classImport) {
    if (!_classIdDict.containsKey(classId)) {
      _classIdDict[classId] = _id;
      _classNameDict[_id] = className;
      _classImportDict[_id] = classImport;
      _id++;
    }
    return _classIdDict[classId];
  }

  /// defensive copy
  static Map<int, String> getDict() => Map.from(_classNameDict);

  /// get template
  static String getContentTemplate() =>
      "const cd = [${getDict().map((k, v) => MapEntry(k, "p$k.$v")).values.join(",")}];";
  static String getImportTemplate() =>
      _classImportDict.map((k, v) => MapEntry(k, "import \"$v\" as p$k")).values.join(";\n") + ";";
  static String getTemplate() => "${getImportTemplate()}\n${getContentTemplate()}";
}
