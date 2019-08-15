import 'package:deflect_generator/src/manager/import_manager.dart';
import 'package:deflect_generator/src/util/code_utils.dart';

abstract class AccessorManager {
  static Map<String, String> setterNameList = {};
  static Map<String, String> getterNameList = {};
  static Map<String, Map<String, String>> staticSetterNameList = {};
  static Map<String, Map<String, String>> staticGetterNameList = {};

  static void registerGetter(String name) {
    if (name.startsWith("_")) {
      return;
    }
    getterNameList[name] = "(o)=>o.$name";
  }

  static void registerSetter(String name) {
    if (name.startsWith("_")) {
      return;
    }
    setterNameList[name] = "(o,e)=>o.$name=e";
  }

  static void _initStaticSetterNameList(String name) {
    staticSetterNameList[name] = {};
  }

  static void _initStaticGetterNameList(String name) {
    staticGetterNameList[name] = {};
  }

  static void registerStaticGetter(String className, String name) {
    if (name.startsWith("_")) {
      return;
    }
    _initStaticGetterNameList(name);
    staticGetterNameList[name][className] = "(o)=>$className.$name";
  }

  static void registerStaticSetter(String className, String name) {
    if (name.startsWith("_")) {
      return;
    }
    _initStaticSetterNameList(name);
    staticSetterNameList[name][className] = "(o,e)=>$className.$name=e";
  }

  static void registerStaticAccessor(String className, String name) {
    if (name.startsWith("_")) {
      return;
    }
    registerStaticSetter(className, name);
    registerStaticGetter(className, name);
  }

  static void registerAccessor(String name) {
    if (name.startsWith("_")) {
      return;
    }
    registerGetter(name);
    registerSetter(name);
  }

  static String getCode() {
    return [
      "import \"package:deflect/src/typedef/accessor.dart\";",
      ImportManager.toTemplate(),
      "var sd=${CodeUtils.getCode(setterNameList, useStringKey: true)};",
      "var gd=${CodeUtils.getCode(getterNameList, useStringKey: true)};",
      "Map<String, Map<Type, Setter>> ssd=${CodeUtils.getCode(staticSetterNameList, useStringKey: true)};",
      "Map<String, Map<Type, Getter>> sgd=${CodeUtils.getCode(staticGetterNameList, useStringKey: true)};",
    ].join("\n");
  }
}
