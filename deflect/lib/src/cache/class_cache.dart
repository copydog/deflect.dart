import 'package:deflect/src/class.dart';
import 'package:deflect/src/reflection_data/reflection.dart';

class ClassCache {
  static Map<int, Class> _cache = {};

  static bool has(int id) {
    return _cache.containsKey(id);
  }

  static Class<T> get<T>(int id) {
    return _cache[id];
  }

  static void set(int id, Class class_) {
    _cache[id] = class_;
  }

  static Class<T> getOrCreate<T>(int id) {
    if (!has(id)) {
      set(id, Class<T>.forId(id));
    }
    return get(id);
  }
}
