class FieldAccessorDictManager {
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

  static String getGetterTemplate() {
    return "var fgd = [${_accessorList.map((e) => "(i)=>i.${e}").join(",")}];";
  }

  static String getSetterTemplate() {
    return "var fsd = [${_accessorList.map((e) => "(i,d)=>i.${e}=d").join(",")}];";
  }

  static String getTemplate() {
    return "${getGetterTemplate()}\n${getSetterTemplate()}";
  }
}

typedef dynamic Accessor(dynamic i);
