import 'dart:io';

abstract class InitializerRenderer {
  static void render() {
    File file = File("generated/deflect/deflect.dart");
    file.writeAsStringSync(
      [
        "import \"class.rd.dart\";",
        "import \"package:deflect/deflect.dart\";",
        "initDeflect() {",
        "  Reflection.load(cd);",
        "}",
      ].join("\n"),
    );
  }
}
