import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/manager/class_reflection_data_manager.dart';
import 'package:deflect_generator/src/manager/field_accessor_dict_manager.dart';
import 'package:deflect_generator/src/manager/string_dict_manager.dart';
import 'package:deflect_generator/src/manager/type_dict_manager.dart';
import 'package:deflect_generator/src/template/class_reflection_data.dart';
import 'package:deflect_generator/src/template/field_reflection_data.dart';
import 'package:deflect_generator/src/util/modifier_utils.dart';
import 'package:deflect_generator/src/util/path_utils.dart';

class ClassCollector {
  static void collect(ClassElement class_) {
    /// avoid empty and already registered class
    if (class_ == null || TypeDictManager.hasTypeId(class_.id)) {
      return;
    }

    /// prepare class info
    int classNameId = StringDictManager.registerString(class_.name);
    int classId = TypeDictManager.registerType(
      class_.id,
      class_.name,
      PathUtils.getImportPath(class_.source),
    );
    ClassReflectionDataManager.registerClassReflectionData(classId, null);
    ClassElement superTypeElement = class_.supertype?.element;

    int superTypeId = -1;

    if (superTypeElement != null) {
      collect(superTypeElement);
      superTypeId = TypeDictManager.getTypeId(classId);
    }

    /// avoid register same data
    if (ClassReflectionDataManager.has(classId)) {
      return;
    }

    /// prepare field info
    List<FieldElement> fields = class_.fields;
    List<FieldElement> privateFields = fields.where((e) => e.isPrivate).toList();
    List<FieldElement> publicFields = fields.where((e) => !e.isPrivate).toList();

    List<int> interfaceIds = class_.interfaces.map(
      (e) {
        collect(e.element);
        TypeDictManager.getTypeId(e.element.id);
      },
    ).toList();

    List<FieldReflectionData> privateFieldTemplates = privateFields.map(
      (e) {
        int type = -1;
        if (e.type.element is ClassElement) {
          collect(e.type.element);
          type = TypeDictManager.getTypeId(e.type.element.id);
        }
        return FieldReflectionData(
          classId,
          ModifierUtils.getFieldModifiers(
            e.isPublic && !e.hasProtected,
            e.hasProtected,
            e.isPrivate,
            e.isStatic,
            e.isConst,
            e.isFinal,
          ),
          StringDictManager.registerString(e.name),
          type,
          FieldAccessorDictManager.registerAccessor(e.name),
          e.isEnumConstant ? 1 : 0,
          e.isSynthetic ? 1 : 0,
        );
      },
    ).toList();

    List<FieldReflectionData> publicFieldTemplates = publicFields.map(
      (e) {
        int type = -1;
        if (e.type.element is ClassElement) {
          collect(e.type.element);
          type = TypeDictManager.getTypeId(e.type.element.id);
        }
        return FieldReflectionData(
          classId,
          ModifierUtils.getFieldModifiers(
            e.isPublic && !e.hasProtected,
            e.hasProtected,
            e.isPrivate,
            e.isStatic,
            e.isConst,
            e.isFinal,
          ),
          StringDictManager.registerString(e.name),
          type,
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
