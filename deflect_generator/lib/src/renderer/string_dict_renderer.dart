import 'dart:io';

import 'package:deflect_generator/src/manager/class_dict_manager.dart';
import 'package:deflect_generator/src/manager/string_dict_manager.dart';

class StringDictRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/string_dict.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync(StringDictManager.getTemplate());
  }
}
