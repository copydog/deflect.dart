import 'dart:io';

import 'package:deflect_generator/src/manager/accessor_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_dict_manager.dart';

class AccessorDictRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/accessor_dict.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync(AccessorDictManager.getTemplate());
  }
}
