import 'package:deflect/src/cache/class_cache.dart';
import 'package:deflect/src/class.dart';
import 'package:deflect/src/reflection_data/reflection_data_manager.dart';

Class<T> deflect<T>(Object obj) {
  int classId;
  if (obj is Type) {
    classId = ReflectionDataManager.getClassTypeId(obj);
  } else {
    classId = ReflectionDataManager.getClassTypeId(obj.runtimeType);
  }
  return ClassCache.getOrCreate<T>(classId);
}
