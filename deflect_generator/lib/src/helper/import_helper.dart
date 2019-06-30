import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/util/path_utils.dart';

class ImportHelper {
  int _id = 0;

  Map<ClassElement, int> _classDict = {};

  Map<int, String> _importDict = {};

  ImportHelper() {}

  int add(ClassElement class_) {
    if (_classDict.containsKey(class_)) {
      return _classDict[class_];
    }

    _classDict[class_] = _id;
    _importDict[_id] = PathUtils.getImportPath(class_.source);

    return _id++;
  }

  String getTemplate() {
    return "${_importDict.map((k, v) => MapEntry(k, "import \"$v\" as p$k;")).values.join("\n")}";
  }
}

class ImportObject {
  final String prefix;
  final int id;
  const ImportObject(
    this.prefix,
    this.id,
  );
}
