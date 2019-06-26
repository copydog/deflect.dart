import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/manager/accessor_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_reflection_data_manager.dart';
import 'package:deflect_generator/src/manager/string_dict_manager.dart';
import 'package:deflect_generator/src/template/class_reflection_data.dart';
import 'package:deflect_generator/src/template/field_reflection_data.dart';

class ClassCollector {
  static void collect(ClassElement class_) {
    /// prepare class info
    int classNameId = StringDictManager.registerString(class_.name);
    int classId = ClassDictManager.registerClass(class_.id);
    int superTypeId = ClassDictManager.registerClass(class_.supertype.element.id);

    /// avoid register same data
    if (ClassReflectionDataManager.has(classId)) {
      return;
    }

    /// prepare field info
    List<FieldElement> fields = class_.fields;
    List<FieldElement> privateFields = fields.where((e) => e.isPrivate).toList();
    List<FieldElement> publicFields = fields.where((e) => !e.isPrivate).toList();

    List<int> interfaceIds =
        class_.interfaces.map((e) => ClassDictManager.registerClass(e.element.id)).toList();

    List<FieldReflectionData> privateFieldTemplates = privateFields
        .map(
          (e) => FieldReflectionData(
                classId,
                0x000001,
                StringDictManager.registerString(e.name),
                -1,
                AccessorDictManager.registerAccessor(e.name),
              ),
        )
        .toList();

    List<FieldReflectionData> publicFieldTemplates = publicFields
        .map(
          (e) => FieldReflectionData(
                classId,
                0x000001,
                StringDictManager.registerString(e.name),
                -1,
                AccessorDictManager.registerAccessor(e.name),
              ),
        )
        .toList();

    /// register data
    ClassReflectionDataManager.registerClassReflectionData(
      classId,
      ClassReflectionData(
        classId,
        classNameId,
        superTypeId,
        interfaceIds,
        privateFieldTemplates,
        publicFieldTemplates,
      ),
    );
  }
}
