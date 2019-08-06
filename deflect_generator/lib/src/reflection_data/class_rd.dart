import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:deflect_generator/src/reflection_data/class_field_rd.dart';

/// Class Reflection Data (RD)
class ClassRD {
  /// fields RD of the class
  List<ClassFieldRD> privateFields;
  List<ClassFieldRD> publicFields;

  ClassRD({
    @required this.privateFields,
    @required this.publicFields,
  });

  Map toJson() {
    return {
      "privateFields": privateFields,
      "publicFields": publicFields,
    };
  }
}
