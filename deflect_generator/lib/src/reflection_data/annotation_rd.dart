import 'package:deflect_generator/src/util/code_utils.dart';
import 'package:meta/meta.dart';

class AnnotationRd {
  String type;
  String data;

  AnnotationRd({
    @required this.type,
    @required this.data,
  });

  String toString() {
    return CodeUtils.getCode({
      "type": type,
      "data": data,
    }, useStringKey: true);
  }
}
