import 'dart:io';

import 'package:deflect_generator/src/manager/accessor_manager.dart';

abstract class AccessorRenderer {
  static void render() {
    File file = File("generated/deflect/accessor.rd.dart");
    file.writeAsStringSync(AccessorManager.getCode());
  }
}
