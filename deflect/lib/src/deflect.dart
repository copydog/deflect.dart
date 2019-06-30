import 'package:deflect/src/cache/class_cache.dart';
import 'package:deflect/src/class.dart';
import 'package:deflect/src/reflection_data/reflection.dart';

Class<T> deflect<T>([T obj]) {
//  print(obj);
//  print(obj.runtimeType);
//  int classId;
//
//  if (obj is Type) {
//    classId = Reflection.getClassTypeId(obj);
//  } else {
//    classId = Reflection.getClassTypeId(obj.runtimeType);
//  }
  return ClassCache.getOrCreate<T>(Reflection.getClassTypeId(T));
}
