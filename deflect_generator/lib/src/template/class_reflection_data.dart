import 'dart:convert';

import 'package:deflect_generator/src/constant/class_reflection_data_constants.dart';
import 'package:deflect_generator/src/template/field_reflection_data.dart';

class ClassReflectionData {
  int classId;

  int classNameId;

  int superTypeId;

  List<int> interfaceIds;

  /// field reflection data of private fields
  List<FieldReflectionData> privateFieldReflectionData;

  /// field reflection data of public fields
  List<FieldReflectionData> publicFieldReflectionData;

  ClassReflectionData(
    this.classId,
    this.classNameId,
    this.superTypeId,
    this.interfaceIds,
    this.privateFieldReflectionData,
    this.publicFieldReflectionData,
  );

  String toString() => json.encode(toJson());

  List toJson() {
    return <int, dynamic>{
      // class id
      ClassReflectionDataConstant.CLASS: classId,
      // class name id
      ClassReflectionDataConstant.CLASS_NAME: classNameId,
      // super type
      ClassReflectionDataConstant.SUPER_TYPE: superTypeId,
      // interfaces
      ClassReflectionDataConstant.INTERFACES: interfaceIds,
      // fields
      ClassReflectionDataConstant.DECLARED_PRIVATE_FIELDS: privateFieldReflectionData,
      ClassReflectionDataConstant.DECLARED_PUBLIC_FIELDS: publicFieldReflectionData,
      // methods
      ClassReflectionDataConstant.DECLARED_PRIVATE_METHODS: [],
      ClassReflectionDataConstant.DECLARED_PUBLIC_METHODS: [],
      // constructors
      ClassReflectionDataConstant.DECLARED_PRIVATE_CONSTRUCTORS: [],
      ClassReflectionDataConstant.DECLARED_PUBLIC_CONSTRUCTORS: [],
    }.values.toList();
  }
}
