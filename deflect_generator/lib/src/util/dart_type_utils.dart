import 'package:analyzer/dart/element/type.dart';

abstract class DartTypeUtils {
  static bool isPrimitive(DartType type) {
    return type.isDartCoreBool || type.isDartCoreDouble || type.isDartCoreInt;
  }

  static bool isNative(DartType type) {
    return isPrimitive(type) ||
        type.isDartAsyncFuture ||
        type.isDartAsyncFutureOr ||
        type.isDartCoreFunction ||
        type.isDartCoreNull ||
        type.isDartCoreString ||
        type.isVoid ||
        type.isObject;
  }

  static bool isDynamic(DartType type) {
    return type.isDynamic;
  }

  static String getCode(DartType type) {
    if (isNative(type)) {
      return type.displayName;
    }

    if (isDynamic(type)) {
      return "Object";
    }

    return null;
  }
}
