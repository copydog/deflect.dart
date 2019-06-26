import 'package:deflect_generator/src/template/class_reflection_data.dart';

class ClassReflectionDataManager {
  static List<ClassReflectionData> _classReflectionDataDict = [null, null, null, null, null];

  static bool has(int id) {
    return _classReflectionDataDict[id] != null;
  }

  static void registerClassReflectionData(int id, ClassReflectionData data) {
    _classReflectionDataDict[id] = data;
  }

  static String getTemplate() {
    return "const rd = [${_classReflectionDataDict.join(",")}];";
  }
}
