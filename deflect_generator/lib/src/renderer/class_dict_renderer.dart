import 'dart:io';

import 'package:deflect_generator/src/manager/class_dict_manager.dart';

class ClassDictRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/class_dict.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync(ClassDictManager.getTemplate());
  }
}
