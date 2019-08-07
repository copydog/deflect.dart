import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/reflection_data/class_field_rd.dart';
import 'package:deflect_generator/src/util/dart_type_utils.dart';
import 'package:deflect_generator/src/util/modifier_utils.dart';

abstract class ClassFieldRdUtils {
  static ClassFieldRd createFromFieldElement(FieldElement element) {
    return new ClassFieldRd(
      name: element.displayName,
      modifiers: ModifierUtils.getFieldModifiers(
        isConst: element.isConst,
        isFinal: element.isFinal,
        isStatic: element.isStatic,
        isProtected: element.hasProtected,
        isPublic: element.isPublic,
        isPrivate: element.isPrivate,
      ),
      type: DartTypeUtils.getCode(element.type),
      isEnumConstant: element.isEnumConstant,
      isSynthetic: element.isSynthetic,
    );
  }
}
