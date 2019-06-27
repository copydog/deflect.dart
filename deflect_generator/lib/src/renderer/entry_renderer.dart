import 'dart:io';

class EntryRenderer {
  static void render() {
    Directory destinationFolder = Directory("lib/generated");
    File destinationFile = File("lib/generated/entry.deflect.dart");
    destinationFolder.createSync(recursive: true);
    destinationFile.writeAsStringSync("""
import "accessor_dict.deflect.dart";
import "class_dict.deflect.dart";
import "string_dict.deflect.dart";
import "reflection_data.deflect.dart";
import "package:deflect/src/lang/reflection_data/reflection_data_manager.dart";

void initDeflect() {
   ReflectionDataManager.load(
    cd,
    sd,
    ad,
    [],
    rd,
  );
}
    """);
  }
}
