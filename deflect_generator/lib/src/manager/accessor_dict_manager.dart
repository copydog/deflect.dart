import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/helper/import_helper.dart';

class AccessorDictManager {
  /// indicates next id
  static int _id = 0;

  static Map<String, Object> _getterList = {};
  static Map<String, Object> _setterList = {};

  static ImportHelper _importHelper = new ImportHelper();

  static int registerAccessor(
    String str,
    ClassElement element, [
    bool isStatic = false,
    bool isMethod = false,
    bool isImmutable = false,
  ]) {
    if (str.startsWith("_")) {
      return -1;
    }

    if (_getterList.containsKey(str)) {
      return _getterList.keys.toList().indexOf(str);
    }

    int classPrefixId = _importHelper.add(element);

    if (isMethod) {
      if (isStatic) {
        _getterList[str] = "(i)=>p$classPrefixId.${element.name}.$str";
        _setterList[str] = "_f";
      } else {
        _getterList[str] = "(i)=>i.$str";
        _setterList[str] = "_f";
      }
    } else {
      if (isStatic) {
        _getterList[str] = "(i)=>p$classPrefixId.${element.name}.$str";
        if (isImmutable) {
          _setterList[str] = "_f";
        } else {
          _setterList[str] = "(i,d)=>p$classPrefixId.${element.name}.$str=d";
        }
      } else {
        _getterList[str] = "(i)=>i.$str";
        if (isImmutable) {
          _setterList[str] = "_f";
        } else {
          _setterList[str] = "(i,d)=>i.$str=d";
        }
      }
    }

    return _id++;
  }

//  static String getGetterTemplate() {
//    return "var fgd = [${_getterList.values.map((e) => "(i)=>i.${e}").join(",")}];";
//  }
//
//  static String getSetterTemplate() {
//    return "var fsd = [${_getterList.values.map((e) => "(i,d)=>i.${e}=d").join(",")}];";
//  }
  static String getGetterTemplate() {
    return "var fgd = [${_getterList.values.join(",")}];";
  }

  static String getSetterTemplate() {
    return "var fsd = [${_setterList.values.join(",")}];";
  }

  static String getTemplate() {
    return "${_importHelper.getTemplate()}\n_f(i) {}\n${getGetterTemplate()}\n${getSetterTemplate()}";
  }
}

typedef dynamic Accessor(dynamic i);
