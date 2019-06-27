import 'package:deflect_generator/src/template/class_reflection_data.dart';

class ClassReflectionDataManager {
  static Map<int, ClassReflectionData> _classReflectionDataDict = {};

  static bool has(int id) {
    return _classReflectionDataDict[id] != null;
  }

  static void registerClassReflectionData(int id, ClassReflectionData data) {
    _classReflectionDataDict[id] = data;
  }

  static String getTemplate() {
    return "const rd = [${_classReflectionDataDict.values.join(",")}];";
  }
}
