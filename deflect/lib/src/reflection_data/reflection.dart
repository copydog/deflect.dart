import 'package:deflect/src/cache/class_cache.dart';
import 'package:deflect/src/constant/class_reflection_data_constants.dart';
import 'package:deflect/src/constant/field_reflection_data_constants.dart';
import 'package:deflect/src/reflect/field.dart';
import 'package:deflect/src/typedef/field_getter.dart';
import 'package:deflect/src/typedef/field_setter.dart';
import 'package:deflect/src/util/ReflectionUtils.dart';

class Reflection {
  static List<Type> _classIdDict;

  static List<String> _stringDict;

  static List<FieldGetter> _fieldGetterDict;

  static List<FieldSetter> _fieldSetterDict;

  static List<Object> _methodReferenceDict;

  static List _classesRd;

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
    _classesRd = classReflectionData;
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

  static int _getStringId(String str) {
    int id = _stringDict.indexOf(str);
    assert(id != -1, "Id of String $str is NOT found in reflection data.");
    return id;
  }

  static String getStringById(int stringId) {
    String str = _stringDict[stringId];
    assert(str != null, "String of Id $stringId is NOT found in reflection data.");
    return str;
  }

  static List<Field> getFields(int classId) {
    return ReflectionUtils.getFieldsFromBytes(
      _getClassRd(classId)[ClassReflectionDataConstants.DECLARED_PUBLIC_FIELDS],
    );
  }

  static FieldGetter getFieldGetter(int accessorId) {
    FieldGetter fieldGetter = _fieldGetterDict[accessorId];
    assert(fieldGetter != null, "FieldGetter of Id $accessorId is NOT found in reflection data.");
    return fieldGetter;
  }

  static FieldSetter getFieldSetter(int accessorId) {
    FieldSetter fieldSetter = _fieldSetterDict[accessorId];
    assert(fieldSetter != null, "FieldSetter of Id $accessorId is NOT found in reflection data.");
    return fieldSetter;
  }

  static List _getClassRd(int classId) => _classesRd[classId];
}
