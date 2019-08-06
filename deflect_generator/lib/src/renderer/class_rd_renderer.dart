import 'dart:io';

import 'package:deflect_generator/src/manager/class_manager.dart';

abstract class ClassRdRenderer {
  static void render() {
//    print(ClassManager.getCode());
    File file = File("generated/deflect/class.rd.dart");
    Directory containingFolder = Directory("generated/deflect/");
    if (!containingFolder.existsSync()) {
      containingFolder.createSync(recursive: true);
    }
    file.writeAsStringSync(ClassManager.getCode());
  }
}
