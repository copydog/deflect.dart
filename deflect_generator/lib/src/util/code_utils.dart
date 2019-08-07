abstract class CodeUtils {
  static String getCode(Object obj, {bool useStringKey = false}) {
    if (obj is Map) {
      return getCodeFromMap(obj, useStringKey: useStringKey);
    } else if (obj is List) {
      return getCodeFromList(obj);
    }
    return "";
  }

  static String getCodeFromMap(Map map, {bool useStringKey = false}) {
    StringBuffer sb = StringBuffer("{");
    for (MapEntry<Object, Object> me in map.entries) {
      String valueStr;

      if (me.value is String) {
//        valueStr = "\"${me.value}\"";
        valueStr = "${me.value}";
      } else if (me.value is Map) {
        valueStr = getCodeFromMap(me.value);
      } else if (me.value is List) {
        valueStr = getCodeFromList(me.value);
      } else {
        valueStr = me.value.toString();
      }

      if (useStringKey) {
        sb.write("\"${me.key}\":$valueStr,");
      } else {
        sb.write("${me.key}:$valueStr,");
      }
    }
    sb.write("}");
    return sb.toString().replaceAll(",}", "}");
  }

  static String getCodeFromList(List list) {
    StringBuffer sb = StringBuffer("[");
    for (Object item in list) {
      String valueStr;

      if (item is String) {
        valueStr = "\"${item}\"";
      } else if (item is Map) {
        valueStr = getCodeFromMap(item);
      } else if (item is List) {
        valueStr = getCodeFromList(item);
      } else {
        valueStr = item.toString();
      }

      sb.write("$valueStr,");
    }
    sb.write("]");
    return sb.toString().replaceAll(",]", "]");
  }
}
