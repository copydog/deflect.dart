import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:deflect_generator/src/manager/field_accessor_dict_manager.dart';
import 'package:deflect_generator/src/manager/type_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_reflection_data_manager.dart';
import 'package:deflect_generator/src/manager/string_dict_manager.dart';
import 'package:deflect_generator/src/template/class_reflection_data.dart';
import 'package:deflect_generator/src/template/field_reflection_data.dart';
import 'package:deflect_generator/src/util/path_utils.dart';

class ClassCollector {
  static void collect(ClassElement class_) {
    /// avoid empty
    if (class_ == null) {
      return;
    }

    /// prepare class info
    int classNameId = StringDictManager.registerString(class_.name);
    int classId = TypeDictManager.registerType(
      class_.id,
      class_.name,
      PathUtils.getImportPath(class_.source),
    );
    ClassElement superTypeElement = class_.supertype?.element;

    /// collector super type
    collect(superTypeElement);

    int superTypeId = -1;

    if (superTypeElement != null) {
      superTypeId = TypeDictManager.registerType(
        superTypeElement.id,
        superTypeElement.name,
        PathUtils.getImportPath(superTypeElement.source),
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
          (e) => TypeDictManager.registerType(
                e.element.id,
                e.element.name,
                PathUtils.getImportPath(e.element.source),
              ),
        )
        .toList();

    class_.interfaces.forEach((e) => collect(e.element));

    List<FieldReflectionData> privateFieldTemplates = privateFields
        .map(
          (e) => FieldReflectionData(
                classId,
                0x000001,
                StringDictManager.registerString(e.name),
                TypeDictManager.registerType(
                  e.id,
                  e.type.name,
                  PathUtils.getImportPath(e.type.element.source),
                ),
                FieldAccessorDictManager.registerAccessor(e.name),
                e.isEnumConstant ? 1 : 0,
                e.isSynthetic ? 1 : 0,
              ),
        )
        .toList();

    List<FieldReflectionData> publicFieldTemplates = publicFields.map(
      (e) {
        return FieldReflectionData(
          classId,
          0x000001,
          StringDictManager.registerString(e.name),
          TypeDictManager.registerType(
            e.id,
            e.type.name,
            PathUtils.getImportPath(e.type.element.source),
          ),
          FieldAccessorDictManager.registerAccessor(e.name),
          e.isEnumConstant ? 1 : 0,
          e.isSynthetic ? 1 : 0,
        );
      },
    ).toList();

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
