import 'package:deflect/deflect.dart';
import 'package:meta/meta.dart';

@sealed
abstract class ModifierUtils {
  static int getFieldModifiers({
    @required bool isPublic,
    @required bool isProtected,
    @required bool isPrivate,
    @required bool isStatic,
    @required bool isConst,
    @required bool isFinal,
  }) {
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
