import 'dart:io';

import 'package:deflect_generator/src/manager/field_getter_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_dict_manager.dart';

class FieldGetterDictRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/field_getter_dict.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync(FieldGetterDictManager.getTemplate());
  }
}
