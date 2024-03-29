import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/manager/class_manager.dart';

class ClassCollector {
  static void collect(ClassElement class_) {
    if (class_ == null) {
      return;
    }

    /// avoid empty and already registered class
    if (ClassManager.has(class_)) {
      return;
    }

    ClassManager.collect(class_);
//    /// avoid empty and already registered class
//    if (class_ == null || TypeDictManager.hasTypeId(class_.id)) {
//      return;
//    }
//
//    /// prepare class info
//    int classNameId = ValueDictManager.registerValue(class_.name);
//    int classId = TypeDictManager.registerType(
//      class_.id,
//      class_.name,
//      PathUtils.getImportPath(class_.source),
//    );
//
//    /// annotation
//    class_.metadata.map(AnnotationTypeUtils.getClassElement).forEach(collect);
////    List<int> annotationList =
////        AnnotationDictManager.registerAnnotations(class_);
//
////    print("annotationList: $annotationList");
//
//    ClassReflectionDataManager.registerClassReflectionData(classId, null);
//    ClassElement superTypeElement = class_.supertype?.element;
//
//    int superTypeId = -1;
//
//    // try to collect super type
//    if (superTypeElement != null) {
//      collect(superTypeElement);
//      superTypeId = TypeDictManager.getTypeId(superTypeElement.id);
//    }
//
//    /// avoid register same data
//    if (ClassReflectionDataManager.has(classId)) {
//      return;
//    }
//
//    /// prepare field info
//    List<FieldElement> fields = class_.fields;
//    List<FieldElement> privateFields =
//        fields.where((e) => e.isPrivate).toList();
//    List<FieldElement> publicFields =
//        fields.where((e) => !e.isPrivate).toList();
//
//    List<int> interfaceIds = class_.interfaces.map(
//      (e) {
//        collect(e.element);
//        TypeDictManager.getTypeId(e.element.id);
//      },
//    ).toList();
//
//    List<FieldReflectionData> privateFieldTemplates = privateFields.map(
//      (e) {
//        int type = -1;
//        if (e.type.element is ClassElement) {
//          collect(e.type.element);
//          type = TypeDictManager.getTypeId(e.type.element.id);
//        }
//        return FieldReflectionData(
//          classId,
//          ModifierUtils.getFieldModifiers(
//            e.isPublic && !e.hasProtected,
//            e.hasProtected,
//            e.isPrivate,
//            e.isStatic,
//            e.isConst,
//            e.isFinal,
//          ),
//          ValueDictManager.registerValue(e.name),
//          type,
//          AccessorDictManager.registerAccessor(
//              e.name, class_, e.isStatic, false, e.isConst || e.isFinal),
//          e.isEnumConstant ? 1 : 0,
//          e.isSynthetic ? 1 : 0,
//        );
//      },
//    ).toList();
//
//    List<FieldReflectionData> publicFieldTemplates = publicFields.map(
//      (e) {
//        int type = -1;
//        if (e.type.element is ClassElement) {
//          collect(e.type.element);
//          type = TypeDictManager.getTypeId(e.type.element.id);
//        }
//        return FieldReflectionData(
//          classId,
//          ModifierUtils.getFieldModifiers(
//            e.isPublic && !e.hasProtected,
//            e.hasProtected,
//            e.isPrivate,
//            e.isStatic,
//            e.isConst,
//            e.isFinal,
//          ),
//          ValueDictManager.registerValue(e.name),
//          type,
//          AccessorDictManager.registerAccessor(
//            e.name,
//            class_,
//            e.isStatic,
//            e.isConst || e.isFinal,
//          ),
//          e.isEnumConstant ? 1 : 0,
//          e.isSynthetic ? 1 : 0,
//        );
//      },
//    ).toList();
//
//    /// register data
//    ClassReflectionDataManager.registerClassReflectionData(
//      classId,
//      ClassReflectionData(
//        classId,
//        classNameId,
//        superTypeId,
//        interfaceIds,
//        privateFieldTemplates,
//        publicFieldTemplates,
//      ),
//    );
  }
}
