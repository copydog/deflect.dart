import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/helper/import_helper.dart';
import 'package:deflect_generator/src/reflection_data/class_rd.dart';
import 'package:deflect_generator/src/util/class_rd_utils.dart';
import 'package:deflect_generator/src/util/code_utils.dart';

class ClassManager {
  static ImportHelper importHelper = new ImportHelper();

  static Map<ClassElement, ClassRd> _classDict = {};

  /// decide if the given class is already registered
  static bool has(ClassElement element) {
    return _classDict.containsKey(element);
  }

  /// collect the given class
  static void collect(ClassElement element, {override: false}) {
    if (has(element) && !override) {
      return;
    }

    importHelper.add(element);

    _classDict[element] = ClassRDUtils.createFromClassElement(element);
  }

  static String getCode() {
    var finalDict = _classDict.map((k, v) => MapEntry(k.displayName, v));
    return "$importHelper\nvar a = ${CodeUtils.getCode(finalDict, useStringKey: true)};";
  }
}
