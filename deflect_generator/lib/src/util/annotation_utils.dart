import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation_type_utils.dart';

@sealed
abstract class AnnotationUtils {
  static Map getCompressedObject(ElementAnnotation annotation) {
    ConstantReader annotationReader =
        ConstantReader(annotation.computeConstantValue());

    ClassElement annotationClass =
        AnnotationTypeUtils.getClassElement(annotation);

    Iterable<FieldElement> fields =
        annotationClass.fields.where((e) => !e.isPrivate);

    for (var field in fields) {}
  }
}
