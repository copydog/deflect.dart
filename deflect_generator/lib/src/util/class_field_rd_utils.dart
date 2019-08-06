import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/reflection_data/class_field_rd.dart';
import 'package:deflect_generator/src/util/modifier_utils.dart';

abstract class ClassFieldRdUtils {
  static ClassFieldRD createFromFieldElement(FieldElement element) {
    return new ClassFieldRD(
      name: element.displayName,
      modifiers: ModifierUtils.getFieldModifiers(
        isConst: element.isConst,
        isFinal: element.isFinal,
        isStatic: element.isStatic,
        isProtected: element.hasProtected,
        isPublic: element.isPublic,
        isPrivate: element.isPrivate,
      ),
      type: element.type.displayName,
      isEnumConstant: element.isEnumConstant,
      isSynthetic: element.isSynthetic,
    );
  }
}
