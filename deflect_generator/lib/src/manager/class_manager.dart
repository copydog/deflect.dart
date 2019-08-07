import 'package:deflect_generator/src/util/dart_type_utils.dart';
import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/manager/import_manager.dart';
import 'package:deflect_generator/src/reflection_data/class_rd.dart';
import 'package:deflect_generator/src/util/class_rd_utils.dart';
import 'package:deflect_generator/src/util/code_utils.dart';
import 'package:deflect_generator/src/util/path_utils.dart';

@sealed
abstract class ClassManager {
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

    // avoid scan generator
    String classPath = PathUtils.getImportPath(element.source);
    if (classPath.startsWith("package:deflect_generator/") ||
        classPath.startsWith("package:deflect/")) {
      return;
    }

    ImportManager.add(element);

    _classDict[element] = ClassRDUtils.createFromClassElement(element);
  }

  static String getCode() {
    var finalDict =
        _classDict.map((k, v) => MapEntry(DartTypeUtils.getCode(k.type), v));
    return "${ImportManager.toTemplate()}\nt<T>()=>T;\nvar cd = ${CodeUtils.getCode(finalDict)};";
  }
}
