import '../../class.dart';
import 'member.dart';

class Field implements Member {
  Map _fieldInfo = {
    1: "fieldName",
    2: 1111,
    3: 1,
  };

  Class _class;

  Field(this._fieldInfo, this._class);

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
