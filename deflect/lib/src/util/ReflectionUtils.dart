import 'package:meta/meta.dart';
import 'package:deflect/src/cache/class_cache.dart';
import 'package:deflect/src/constant/field_reflection_data_constants.dart';
import 'package:deflect/src/reflect/field.dart';
import 'package:deflect/src/reflection_data/reflection.dart';

@sealed
abstract class ReflectionUtils {
  static List<Field> getFieldsFromBytes(List bytesList) {
    return List<Field>.from(
      bytesList.map(
        (rd) => Field(
              ClassCache.getOrCreate(rd[FieldReflectionDataConstants.CLASS_ID]),
              rd[FieldReflectionDataConstants.MODIFIERS],
              Reflection.getStringById(rd[FieldReflectionDataConstants.FIELD_NAME_ID]),
              ClassCache.getOrCreate(rd[FieldReflectionDataConstants.FIELD_TYPE_ID]),
              rd[FieldReflectionDataConstants.ACCESSOR_ID],
              rd[FieldReflectionDataConstants.IS_ENUM_CONSTANT] == 1,
              rd[FieldReflectionDataConstants.IS_SYNTHETIC] == 1,
            ),
      ),
    );
  }
}
