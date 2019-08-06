abstract class CodeUtils {
  static String getCodeFromMap(Map map) {
    StringBuffer sb = StringBuffer("{");
    for (MapEntry<Object, Object> me in map.entries) {
      String valueStr;

      if (me.value is String) {
        valueStr = "\"${me.value}\"";
      } else if (me.value is Map) {
        valueStr = getCodeFromMap(me.value);
      } else if (me.value is List) {
        valueStr = getCodeFromList(me.value);
      } else {
        valueStr = me.value.toString();
      }

      sb.write("${me.key}:$valueStr,");
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
