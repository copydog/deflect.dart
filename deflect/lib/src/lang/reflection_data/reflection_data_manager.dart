import 'package:deflect/src/lang/constant/class_reflection_data_constants.dart';
import 'package:deflect/src/lang/constant/field_reflection_data_constants.dart';
import 'package:deflect/src/lang/reflect/field.dart';
import 'package:deflect/src/lang/typedef/field_getter.dart';
import 'package:deflect/src/lang/typedef/field_setter.dart';

class ReflectionDataManager {
  static List<Type> _classIdDict;

  static List<String> _stringDict;

  static List<FieldGetter> _fieldGetterDict;

  static List<FieldSetter> _fieldSetterDict;

  static List<Object> _methodReferenceDict;

  static List _classReflectionData;

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
    _classReflectionData = classReflectionData;
  }

  static int getClassId(Type classType) {
    int id = _classIdDict.indexOf(classType);
    assert(id != -1, "Id of Class $classType is NOT found in reflection data.");
    return id;
  }

  static Type getClassById(int classId) {
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
    List fieldDict =
        _classReflectionData[classId][ClassReflectionDataConstants.DECLARED_PUBLIC_FIELDS];
    return Field(
      fieldDict.firstWhere((e) => e[FieldReflectionDataConstants.FIELD_NAME_ID] == fieldNameId),
    );
  }

  static List<Field> getFields(int classId) {
    return List<Field>.from(
      (_classReflectionData[classId][ClassReflectionDataConstants.DECLARED_PUBLIC_FIELDS] as List)
          .map((e) => Field(e)),
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
