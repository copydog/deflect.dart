class AccessorDictManager {
  /// indicates next id
  static int _id = 0;

  static List<String> _accessorList = [];

  static int registerAccessor(String str) {
    if (str.startsWith("_")) {
      return -1;
    }
    if (_accessorList.contains(str)) {
      return _accessorList.indexOf(str);
    }
    _accessorList.add(str);
    return _id++;
  }

  static String getTemplate() {
    return "var ad = [${_accessorList.map((e) => "(i)=>i.${e}").join(",")}];";
  }
}

typedef dynamic Accessor(dynamic i);
