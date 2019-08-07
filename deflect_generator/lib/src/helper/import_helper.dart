import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/util/path_utils.dart';

class ImportHelper {
  int _id = 0;

  List<String> _importDict = [];

  ImportHelper() {}

  int add(ClassElement class_) {
    String path = PathUtils.getImportPath(class_.source);

    if (_importDict.contains(path)) {
      return _importDict.indexOf(path);
    }

    _importDict.add(path);

    return _id++;
  }

  String toString() {
    return "${_importDict.map((e) => "import \"$e\" as p${_importDict.indexOf(e)};").join("\n")}";
  }
}
