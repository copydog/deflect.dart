import 'dart:io';

abstract class InitializerRenderer {
  static void render() {
    File file = File("generated/deflect/deflect.dart");
    file.writeAsStringSync(
      [
        "import \"class.rd.dart\";",
        "import \"accessor.rd.dart\";",
        "import \"package:deflect/src/reflection/reflection.dart\";",
        "initDeflect() {",
        "  Reflection.load(classesRd: cd, getterDict: gd, setterDict: sd, staticGetterDict: sgd, staticSetterDict: ssd);",
        "}",
      ].join("\n"),
    );
  }
}
