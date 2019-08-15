import 'package:deflect/deflect.dart';
import 'package:deflect/src/reflect/field.dart';
import 'package:deflect/src/typedef/accessor.dart';
import 'package:deflect/src/util/ReflectionUtils.dart';

class Reflection {
  static Map<Type, Map> classesRd;
  static Map<String, Getter> getterDict;
  static Map<String, Setter> setterDict;
  static Map<String, Map<Type, Getter>> staticGetterDict;
  static Map<String, Map<Type, Setter>> staticSetterDict;

  static void load({
    Map<Type, Map> classesRd,
    Map<String, Getter> getterDict,
    Map<String, Setter> setterDict,
    Map<String, Map<Type, Getter>> staticGetterDict,
    Map<String, Map<Type, Setter>> staticSetterDict,
  }) {
    Reflection.classesRd = classesRd;
    Reflection.getterDict = getterDict;
    Reflection.setterDict = setterDict;
    Reflection.staticGetterDict = staticGetterDict;
    Reflection.staticSetterDict = staticSetterDict;
  }

  static Class getClass<T>(Type type) {
    return Class<T>.fromType(type);
  }

  static Setter _getSetter(String name) => setterDict[name];

  static Getter _getGetter(String name) => getterDict[name];

  static Setter _getStaticSetter(String name, Type type) {
    if (staticSetterDict[name] == null) {
      return null;
    }
    return staticSetterDict[name][type];
  }

  static Getter _getStaticGetter(String name, Type type) {
    if (staticGetterDict[name] == null) {
      return null;
    }
    return staticGetterDict[name][type];
  }

  static Object getFieldValue(Object obj, String name) {
    Getter getter;

    if (obj is Type) {
      getter = _getStaticGetter(name, obj);
    } else {
      getter = _getGetter(name);
    }

    if (getter == null) {
      return null;
    }

    return getter(obj);
  }

  static void setFieldValue(Object obj, String name, Object value) {
    Setter setter;

    if (obj is Type) {
      setter = _getStaticSetter(name, obj);
    } else {
      setter = _getSetter(name);
    }

    if (setter == null) {
      return;
    }

    setter(obj, value);
  }

  static List<Field> getFields(Class class_) {
    return ReflectionUtils.getPublicFieldsV1(
        class_, classesRd[class_.deflectedType]);
  }

  static List<Field> getDeclaredFields(Class class_) {
    return ReflectionUtils.getDeclaringFieldsV1(
        class_, classesRd[class_.deflectedType]);
  }
}
