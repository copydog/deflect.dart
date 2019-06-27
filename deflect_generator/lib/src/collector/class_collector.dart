import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:deflect_generator/src/manager/accessor_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_reflection_data_manager.dart';
import 'package:deflect_generator/src/manager/string_dict_manager.dart';
import 'package:deflect_generator/src/template/class_reflection_data.dart';
import 'package:deflect_generator/src/template/field_reflection_data.dart';

class ClassCollector {
  static void collect(ClassElement class_) {
    /// avoid empty
    if (class_ == null) {
      return;
    }

    /// prepare class info
    int classNameId = StringDictManager.registerString(class_.name);
    int classId = ClassDictManager.registerClass(
      class_.id,
      class_.name,
      class_.source.uri.toString().replaceFirst("asset", "package"),
    );
    ClassElement superTypeElement = class_.supertype?.element;

    /// collector super type
    collect(superTypeElement);

    int superTypeId = -1;

    if (superTypeElement != null) {
      superTypeId = ClassDictManager.registerClass(
        superTypeElement.id,
        superTypeElement.name,
        superTypeElement.source.uri.toString().replaceFirst("asset", "package"),
      );
    }

    /// avoid register same data
    if (ClassReflectionDataManager.has(classId)) {
      return;
    }

    /// prepare field info
    List<FieldElement> fields = class_.fields;
    List<FieldElement> privateFields = fields.where((e) => e.isPrivate).toList();
    List<FieldElement> publicFields = fields.where((e) => !e.isPrivate).toList();

    List<int> interfaceIds = class_.interfaces
        .map(
          (e) => ClassDictManager.registerClass(
                e.element.id,
                e.element.name,
                e.element.source.uri.toString().replaceFirst("asset", "package"),
              ),
        )
        .toList();

    /// collect all interfaces
//    class_.interfaces.forEach((e) => collect(e.element));

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