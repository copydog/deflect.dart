import 'dart:io';

import 'package:deflect_generator/src/manager/class_manager.dart';

abstract class ClassRdRenderer {
  static void render() {
    File file = File("generated/deflect/class.rd.dart");
    file.writeAsStringSync(ClassManager.getCode());
  }
}
