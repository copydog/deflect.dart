import 'package:meta/meta.dart';

class ClassFieldRD {
  String name;
  int modifiers;
  String type;
  bool isEnumConstant;
  bool isSynthetic;

  ClassFieldRD({
    @required this.name,
    @required this.modifiers,
    @required this.type,
    @required this.isEnumConstant,
    @required this.isSynthetic,
  });

  Map toJson() {
    return {
      "name": name,
      "modifiers": modifiers,
      "type": type,
      "isEnumConstant": isEnumConstant,
      "isSynthetic": isSynthetic,
    };
  }
}
