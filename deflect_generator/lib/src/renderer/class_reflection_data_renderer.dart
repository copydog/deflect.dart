import 'dart:io';

import 'package:deflect_generator/src/manager/class_reflection_data_manager.dart';

class ClassReflectionDataRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/reflection_data.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync(ClassReflectionDataManager.getTemplate());
  }
}
