import 'package:deflect/deflect.dart';
import 'package:deflect/src/reflect/field.dart';
import 'package:meta/meta.dart';

@sealed
abstract class ReflectionUtils {
  static List<Field> getPublicFieldsV1(Class class_, Map classRd) {
    List fieldsRd = classRd["publicFields"];
    return fieldsRd
        .map(
          (rd) => Field(
            class_,
            rd["modifiers"],
            rd["name"],
            Class.fromType(rd["type"]),
            rd["isEnumConstant"],
            rd["isSynthetic"],
            rd["annotations"],
          ),
        )
        .toList();
  }

  static List<Field> getDeclaringFieldsV1(Class class_, Map classRd) {
    List publicFieldsRd = classRd["publicFields"];
    List privateFieldsRd = classRd["privateFields"];
    return publicFieldsRd
        .map(
          (rd) => Field(
            class_,
            rd["modifiers"],
            rd["name"],
            Class.fromType(rd["type"]),
            rd["isEnumConstant"],
            rd["isSynthetic"],
            rd["annotations"],
          ),
        )
        .toList()
          ..addAll(privateFieldsRd
              .map(
                (rd) => Field(
                  class_,
                  rd["modifiers"],
                  rd["name"],
                  Class.fromType(rd["type"]),
                  rd["isEnumConstant"],
                  rd["isSynthetic"],
                  rd["annotations"],
                ),
              )
              .toList());
  }

//  static List<Field> getFieldsFromBytes(List bytesList) {
//    return List<Field>.from(
//      bytesList.map(
//        (rd) => Field(
//              ClassCache.getOrCreate(rd[FieldReflectionDataConstants.CLASS_ID]),
//              rd[FieldReflectionDataConstants.MODIFIERS],
//              Reflection.getStringById(rd[FieldReflectionDataConstants.FIELD_NAME_ID]),
//              ClassCache.getOrCreate(rd[FieldReflectionDataConstants.FIELD_TYPE_ID]),
//              rd[FieldReflectionDataConstants.ACCESSOR_ID],
//              rd[FieldReflectionDataConstants.IS_ENUM_CONSTANT] == 1,
//              rd[FieldReflectionDataConstants.IS_SYNTHETIC] == 1,
//            ),
//      ),
//    );
//  }
}
