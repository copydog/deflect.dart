import 'dart:convert';

import 'package:deflect_generator/src/util/code_utils.dart';
import 'package:deflect_generator/src/util/string_utils.dart';
import 'package:meta/meta.dart';

class AnnotationRd {
  String type;
  Map<String, Object> data;

  AnnotationRd({
    @required this.type,
    @required this.data,
  });

  String toString() {
    return CodeUtils.getCode({
      "type": type,
      "data": json.encode(data),
    }, useStringKey: true);
  }
}
