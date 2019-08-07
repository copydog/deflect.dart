import 'dart:convert';
import 'package:deflect_generator/src/util/code_utils.dart';
import 'package:meta/meta.dart';

import 'package:deflect_generator/src/reflection_data/class_field_rd.dart';

/// Class Reflection Data (RD)
class ClassRd {
  String superType;

  /// fields RD of the class
  List<ClassFieldRd> privateFields;
  List<ClassFieldRd> publicFields;

  ClassRd({
    @required this.privateFields,
    @required this.publicFields,
  });

  String toString() {
    return CodeUtils.getCode({
      "privateFields": privateFields,
      "publicFields": publicFields,
    }, useStringKey: true);
  }
}
