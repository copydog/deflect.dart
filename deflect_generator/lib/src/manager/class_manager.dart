import 'package:deflect_generator/src/manager/accessor_manager.dart';
import 'package:deflect_generator/src/util/dart_type_utils.dart';
import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/manager/import_manager.dart';
import 'package:deflect_generator/src/reflection/class_rd.dart';
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
    // create class rd
    _classDict[element] = ClassRDUtils.createFromClassElement(element);
    // register accessor
    element.fields.where((e) => !e.isStatic)
      ..where((e) => !e.isSynthetic)
          .forEach((e) => AccessorManager.registerAccessor(e.displayName))
      ..where((e) => e.isSynthetic && !(e.getter?.isSynthetic ?? true))
          .forEach((e) => AccessorManager.registerGetter(e.displayName))
      ..where((e) => e.isSynthetic && !(e.setter?.isSynthetic ?? true))
          .forEach((e) => AccessorManager.registerSetter(e.displayName));
    // register static accessor
    element.fields.where((e) => e.isStatic)
      ..where((e) => e.getter != null).forEach(
        (e) => AccessorManager.registerStaticGetter(
          "p${ImportManager.add(element)}.${element.displayName}",
          e.displayName,
        ),
      )
      ..where((e) => e.setter != null).forEach(
        (e) => AccessorManager.registerStaticSetter(
          "p${ImportManager.add(element)}.${element.displayName}",
          e.displayName,
        ),
      );
  }

  static String getCode() {
    var finalDict =
        _classDict.map((k, v) => MapEntry(DartTypeUtils.getCode(k.type), v));
    return "import \"shared_utils.dart\";\n${ImportManager.toTemplate()}\nvar cd = ${CodeUtils.getCode(finalDict)};";
  }
}
