import 'package:meta/meta.dart';

class AnnotationRd {
  String type;
  String data;

  AnnotationRd({
    @required this.type,
    @required this.data,
  });

  Map toJson() {
    return {
      "type": type,
      "data": data,
    };
  }
}
