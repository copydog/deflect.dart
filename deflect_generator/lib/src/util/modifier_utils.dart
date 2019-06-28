import 'package:deflect/deflect.dart';
import 'package:meta/meta.dart';

@sealed
abstract class ModifierUtils {
  static int getFieldModifiers(
    bool isPublic,
    bool isProtected,
    bool isPrivate,
    bool isStatic,
    bool isConst,
    bool isFinal,
  ) {
    int modifier = 0x0;
    if (isPublic) modifier |= Modifier.PUBLIC;
    if (isProtected) modifier |= Modifier.PROTECTED;
    if (isPrivate) modifier |= Modifier.PRIVATE;
    if (isStatic) modifier |= Modifier.STATIC;
    if (isConst) modifier |= Modifier.CONST;
    if (isFinal) modifier |= Modifier.FINAL;
    return modifier;
  }
}
