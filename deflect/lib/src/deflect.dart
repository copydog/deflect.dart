import 'package:deflect/src/class.dart';
import 'package:deflect/src/reflection_data/reflection_data_manager.dart';

Class<T> deflect<T>(Object obj) {
  if (obj is Type) {
    return Class.forId(ReflectionDataManager.getClassTypeId(obj));
  }

  return Class.forId(ReflectionDataManager.getClassTypeId(obj.runtimeType));
}
