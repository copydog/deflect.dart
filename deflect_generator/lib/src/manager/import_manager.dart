import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/util/path_utils.dart';

@sealed
abstract class ImportManager {
  static int _id = 0;

  static List<String> _importDict = [];

  static int add(ClassElement class_) {
    String path = PathUtils.getImportPath(class_.source);

    if (path == "dart:core") {
      return -1;
    }

    if (_importDict.contains(path)) {
      return _importDict.indexOf(path);
    }

    _importDict.add(path);

    return _id++;
  }

  static String toTemplate() {
    return "${_importDict.map((e) => "import \"$e\" as p${_importDict.indexOf(e)};").join("\n")}";
  }
}
