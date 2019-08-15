import 'dart:io';

abstract class SharedUtilsRender {
  static void render() {
    File file = File("generated/deflect/shared_utils.dart");
    file.writeAsStringSync(
      [
        "t<T>()=>T;",
        "var n;",
      ].join("\n"),
    );
  }
}
