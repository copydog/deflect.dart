import 'package:deflect/src/class.dart';
import 'package:deflect/src/reflection/reflection.dart';

Class<T> deflect<T>([T obj]) {
  return Reflection.getClass<T>(T);
}
