import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/reflection_data/class_rd.dart';
import 'package:deflect_generator/src/util/class_rd_utils.dart';

class ClassManager {
  static Map<ClassElement, ClassRD> _classDict = {};

  /// decide if the given class is already registered
  static bool has(ClassElement element) {
    return _classDict.containsKey(element);
  }

  /// collect the given class
  static void collect(ClassElement element, {override: false}) {
    if (has(element) && !override) {
      return;
    }

    _classDict[element] = ClassRDUtils.createFromClassElement(element);
  }

  static String getCode() {
    var finalDict = _classDict.map((k, v) => MapEntry(k.displayName, v));
    return json.encode(finalDict);
  }
}
