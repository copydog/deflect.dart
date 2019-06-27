import 'package:deflect/src/class.dart';
import 'package:deflect/src/lang/constant/field_reflection_data_constants.dart';
import 'package:deflect/src/lang/reflection_data/reflection_data_manager.dart';
import 'member.dart';

class Field implements Member {
  int get _accessorId => _fieldInfo[FieldReflectionDataConstants.ACCESSOR_ID];

  List<dynamic> _fieldInfo = [];

  Class _class;

  Field(this._fieldInfo);

  bool equals(Object obj) {
    if (obj != null && obj is Field) {
      Field other = obj;
      return (getDeclaringClass() == other.getDeclaringClass()) &&
          (getName() == other.getName()) &&
          (getType() == other.getType());
    }
    return false;
  }

  Object get(Object obj) {
    return ReflectionDataManager.getFieldGetter(_accessorId)(obj);
  }

  bool getBoolean(Object obj) => get(obj);

  int getInt(Object obj) => get(obj);

  double getDouble(Object obj) => get(obj);

  Class getType() {
    return null;
  }

  bool isEnumConstant() {
    return null;
  }

  void set(Object obj, Object value) {
    ReflectionDataManager.getFieldSetter(_accessorId)(obj, value);
  }

  void setBoolean(Object obj, bool z) => set(obj, z);

  void setDouble(Object obj, bool d) => set(obj, d);

  String toGenericString() {
    return null;
  }

  String toString() {
    return "";
  }

  //---------------------------------------------------------------------
  // Implementation of Member
  //---------------------------------------------------------------------

  @override
  Class getDeclaringClass() {
    return _class;
  }

  @override
  int getModifiers() {
    return _fieldInfo[2];
  }

  @override
  String getName() {
    return _fieldInfo[1];
  }

  @override
  bool isSynthetic() {
    return _fieldInfo[3] == 1;
  }
}
