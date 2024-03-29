import 'package:deflect_generator/src/reflection/annotation_rd.dart';
import 'package:deflect_generator/src/util/code_utils.dart';
import 'package:deflect_generator/src/util/string_utils.dart';
import 'package:meta/meta.dart';

class ClassFieldRd {
  String name;
  int modifiers;
  String type;
  bool isEnumConstant;
  bool isSynthetic;
  List<AnnotationRd> annotationRdList;

  ClassFieldRd({
    @required this.name,
    @required this.modifiers,
    @required this.type,
    @required this.isEnumConstant,
    @required this.isSynthetic,
    @required this.annotationRdList,
  });

  String toString() {
    return CodeUtils.getCode({
      "name": StringUtils.encode(name),
      "modifiers": modifiers,
      "type": type,
      "isEnumConstant": isEnumConstant,
      "isSynthetic": isSynthetic,
      "annotations": annotationRdList,
    }, useStringKey: true);
  }
}
