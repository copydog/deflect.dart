import 'package:analyzer/dart/element/type.dart';
import 'package:deflect_generator/src/manager/import_manager.dart';
import 'package:source_gen/source_gen.dart';

abstract class DartTypeUtils {
  static bool isPrimitive(DartType type) {
    return type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.displayName == "num";
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

  static bool isLanguageProvided(DartType type) {
    if (isNative(type)) {
      return true;
    }
    return false;
  }

  static bool isDynamic(DartType type) {
    return type.isDynamic;
  }

  static String getCode(DartType type) {
    if (isLanguageProvided(type)) {
      return "${type.displayName}";
    }

    if (isDynamic(type)) {
      return "Object";
    }

    if (type is ParameterizedType) {
      int prefixId = ImportManager.add(type.element);

      String typeName;
      if (prefixId == -1) {
        typeName = "${type.name}";
      } else {
        typeName = "p${prefixId}.${type.name}";
      }
      return "$typeName<${type.typeArguments.map(getCode).join(",")}>";
    }

    return "Null";
  }
}
