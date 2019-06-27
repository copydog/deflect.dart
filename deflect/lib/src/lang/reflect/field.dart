import 'package:deflect/src/class.dart';
import 'package:deflect/src/lang/constant/field_reflection_data_constants.dart';
import 'package:deflect/src/lang/reflection_data/reflection_data_manager.dart';
import 'member.dart';

class Field implements Member {
  int get _accessorId => _fieldRD[FieldReflectionDataConstants.ACCESSOR_ID];

  List<dynamic> _fieldRD = [];

  Field(this._fieldRD);

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

  bool isEnumConstant() => _fieldRD[FieldReflectionDataConstants.IS_ENUM_CONSTANT] == 1;

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
    return null;
  }

  @override
  int getModifiers() {
    return _fieldRD[FieldReflectionDataConstants.MODIFIERS];
  }

  @override
  String getName() {
    return ReflectionDataManager.getStringById(
      _fieldRD[FieldReflectionDataConstants.FIELD_NAME_ID],
    );
  }

  @override
  bool isSynthetic() {
    return _fieldRD[FieldReflectionDataConstants.IS_SYNTHETIC] == 1;
  }
}
