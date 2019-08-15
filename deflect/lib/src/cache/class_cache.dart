import 'package:deflect/src/class.dart';

class ClassCache {
  static Map<Type, Class> _cache = {};

  static bool has(Type type) {
    return _cache.containsKey(type);
  }

  static Class<T> get<T>(Type type) {
    return _cache[type];
  }

  static void set(Type type, Class class_) {
    _cache[type] = class_;
  }

  static Class<T> getOrCreate<T>(Type type) {
    if (!has(type)) {
      set(type, Class<T>.fromType(type));
    }
    return get<T>(type);
  }
}
