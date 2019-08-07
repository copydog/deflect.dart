import 'package:analyzer/src/generated/source.dart';

abstract class PathUtils {
  static String getImportPath(Source source) {
    String path = source.uri
        .toString()
        .replaceFirst("asset", "package")
        .replaceFirst("lib/", "");

    if (path.startsWith("dart")) {
      return path.split("/").first;
    }
    return path;
  }
}
