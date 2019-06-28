import 'dart:io';

import 'package:deflect_generator/src/manager/type_dict_manager.dart';

class TypeDictRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/type_dict.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync(TypeDictManager.getTemplate());
  }
}
