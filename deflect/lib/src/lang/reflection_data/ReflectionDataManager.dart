class ReflectionDataManager {
  static List<Type> _classIdDict;

  static List<String> _stringDict;

  static List<Object> _methodReferenceDict;

  static Map _classReflectionData;

  static int getClassId(Type type) {
    int id = _classIdDict.indexOf(type);
    assert(id != -1, "Id of Class $type is NOT found in reflection data.");
    return id;
  }

  static Type getClassById(int id) {
    Type type = _classIdDict[id];
    assert(type != null, "Class of Id $id is NOT found in reflection data.");
    return type;
  }

  static int getStringId(String str) {
    int id = _stringDict.indexOf(str);
    assert(id != -1, "Id of String $str is NOT found in reflection data.");
    return id;
  }

  static String getStringById(int id) {
    String str = _stringDict[id];
    assert(str != null, "String of Id $id is NOT found in reflection data.");
    return str;
  }
}
