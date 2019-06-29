class TypeDictManager {
  /// indicates next id
  static int _id = 0;

  static Map<int, String> _typeImportDict = {};

  /// string dict that holds string and it's id
  static Map<int, int> _typeIdDict = {};

  static Map<int, String> _typeNameDict = {};

  static bool hasTypeId(int typeId) {
    return _typeIdDict.containsKey(typeId);
  }

  static int getTypeId(int id) {
    assert(_typeIdDict.containsKey(id));
    int typeId = _typeIdDict[id];
    assert(typeId != null);
    return typeId;
  }

  /// register class
  static int registerType(int id, String typeName, String typeImport) {
    if (!_typeIdDict.containsKey(id)) {
      _typeIdDict[id] = _id;
      _typeNameDict[_id] = typeName;
      _typeImportDict[_id] = typeImport;
      _id++;
    }
    return _typeIdDict[id];
  }

  /// defensive copy
  static Map<int, String> getDict() => Map.from(_typeNameDict);

  /// get template
  static String getContentTemplate() =>
      "const cd = [${getDict().map((k, v) => MapEntry(k, "p$k.$v")).values.join(",")}];";
  static String getImportTemplate() =>
      _typeImportDict.map((k, v) => MapEntry(k, "import \"$v\" as p$k")).values.join(";\n") + ";";
  static String getTemplate() => "${getImportTemplate()}\n${getContentTemplate()}";
}
