import 'package:deflect/src/class.dart';
import 'package:deflect/src/exception/private_access_exception.dart';
import 'package:deflect/src/reflect/modifier.dart';
import 'package:deflect/src/reflection_data/reflection.dart';

import 'member.dart';

//@sealed
class Field implements Member {
  Class _declaringClass;
  int _modifiers;
  String _name;
  Class _type;
  int _accessorId;
  bool _isEnumConstant;
  bool _isSynthetic;

  Field(
    this._declaringClass,
    this._modifiers,
    this._name,
    this._type,
    this._accessorId,
    this._isEnumConstant,
    this._isSynthetic,
  );

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
    if (_accessorId == -1) {
      throw new PrivateAccessException();
    }
    return Reflection.getFieldGetter(_accessorId)(obj);
  }

  bool getBoolean(Object obj) => get(obj);

  int getInt(Object obj) => get(obj);

  double getDouble(Object obj) => get(obj);

  num getNum(Object obj) => get(obj);

  Class getType() => _type;

  bool isEnumConstant() => _isEnumConstant;

  void set(Object obj, Object value) {
    if (_accessorId == -1) {
      throw new PrivateAccessException();
    }
    Reflection.getFieldSetter(_accessorId)(obj, value);
  }

  void setInt(Object obj, int i) => set(obj, i);

  void setBoolean(Object obj, bool z) => set(obj, z);

  void setDouble(Object obj, double d) => set(obj, d);

  void setNum(Object obj, num n) => set(obj, n);

  String toGenericString() {
    return null;
  }

  String toString() {
    return Modifier.toPrefixString(getModifiers()) + getName();
  }

  //---------------------------------------------------------------------
  // Implementation of Member
  //---------------------------------------------------------------------

  @override
  Class getDeclaringClass() => _declaringClass;

  @override
  int getModifiers() => _modifiers;

  @override
  String getName() => _name;

  @override
  bool isSynthetic() => _isSynthetic;
}
