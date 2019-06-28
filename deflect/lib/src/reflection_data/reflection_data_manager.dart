import 'package:deflect/src/cache/class_cache.dart';
import 'package:deflect/src/constant/class_reflection_data_constants.dart';
import 'package:deflect/src/constant/field_reflection_data_constants.dart';
import 'package:deflect/src/reflect/field.dart';
import 'package:deflect/src/typedef/field_getter.dart';
import 'package:deflect/src/typedef/field_setter.dart';

class ReflectionDataManager {
  static List<Type> _classIdDict;

  static List<String> _stringDict;

  static List<FieldGetter> _fieldGetterDict;

  static List<FieldSetter> _fieldSetterDict;

  static List<Object> _methodReferenceDict;

  static List _classRd;

  static void load(
    List<Type> classIdDict,
    List<String> stringDict,
    List<FieldGetter> fieldGetterDict,
    List<FieldSetter> fieldSetterDict,
//    List<Object> methodReferenceDict,
    List classReflectionData,
  ) {
    _classIdDict = classIdDict;
    _stringDict = stringDict;
    _fieldGetterDict = fieldGetterDict;
    _fieldSetterDict = fieldSetterDict;
    _classRd = classReflectionData;
  }

  static int getClassTypeId(Type classType) {
    int id = _classIdDict.indexOf(classType);
    assert(id != -1, "Id of Class $classType is NOT found in reflection data.");
    return id;
  }

  static Type getClassTypeById(int classId) {
    Type type = _classIdDict[classId];
    assert(type != null, "Class of Id $classId is NOT found in reflection data.");
    return type;
  }

  static int getStringId(String str) {
    int id = _stringDict.indexOf(str);
    assert(id != -1, "Id of String $str is NOT found in reflection data.");
    return id;
  }

  static String getStringById(int stringId) {
    String str = _stringDict[stringId];
    assert(str != null, "String of Id $stringId is NOT found in reflection data.");
    return str;
  }

  static Field getField(int classId, String fieldName) {
    int fieldNameId = getStringId(fieldName);
    List rd = _classRd[classId][ClassReflectionDataConstants.DECLARED_PUBLIC_FIELDS];
    List fieldRd =
        rd.firstWhere((e) => e[FieldReflectionDataConstants.FIELD_NAME_ID] == fieldNameId);
    return Field(
      ClassCache.getOrCreate(fieldRd[FieldReflectionDataConstants.CLASS_ID]),
      -1,
      getStringById(fieldRd[FieldReflectionDataConstants.FIELD_NAME_ID]),
      ClassCache.getOrCreate(fieldRd[FieldReflectionDataConstants.FIELD_TYPE_ID]),
      fieldRd[FieldReflectionDataConstants.ACCESSOR_ID],
      fieldRd[FieldReflectionDataConstants.IS_ENUM_CONSTANT] == 1,
      fieldRd[FieldReflectionDataConstants.IS_SYNTHETIC] == 1,
    );
  }

  static List<Field> getFields(int classId) {
    return List<Field>.from(
      (_classRd[classId][ClassReflectionDataConstants.DECLARED_PUBLIC_FIELDS] as List).map(
        (rd) => Field(
              ClassCache.getOrCreate(rd[FieldReflectionDataConstants.CLASS_ID]),
              0,
              getStringById(rd[FieldReflectionDataConstants.FIELD_NAME_ID]),
              ClassCache.getOrCreate(rd[FieldReflectionDataConstants.FIELD_TYPE_ID]),
              rd[FieldReflectionDataConstants.ACCESSOR_ID],
              rd[FieldReflectionDataConstants.IS_ENUM_CONSTANT] == 1,
              rd[FieldReflectionDataConstants.IS_SYNTHETIC] == 1,
            ),
      ),
    );
  }

  static FieldGetter getFieldGetter(int fieldId) {
    FieldGetter fieldGetter = _fieldGetterDict[fieldId];
    assert(fieldGetter != null, "FieldGetter of Id $fieldId is NOT found in reflection data.");
    return fieldGetter;
  }

  static FieldSetter getFieldSetter(int fieldId) {
    FieldSetter fieldSetter = _fieldSetterDict[fieldId];
    assert(fieldSetter != null, "FieldSetter of Id $fieldId is NOT found in reflection data.");
    return fieldSetter;
  }
}
