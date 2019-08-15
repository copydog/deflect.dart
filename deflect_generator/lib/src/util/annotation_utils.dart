import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/manager/import_manager.dart';
import 'package:deflect_generator/src/reflection/annotation_rd.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation_type_utils.dart';

@sealed
abstract class AnnotationUtils {
  static Map<String, Object> getData(ElementAnnotation annotation) {
    Map<String, Object> data = {};
    ConstantReader annotationReader =
        ConstantReader(annotation.computeConstantValue());

    ClassElement annotationClass =
        AnnotationTypeUtils.getClassElement(annotation);

    Iterable<FieldElement> fields =
        annotationClass.fields.where((e) => !e.isPrivate);

    for (var field in fields) {
      if (annotationReader.peek(field.displayName)?.isLiteral ?? false) {
        data[field.displayName] =
            annotationReader.peek(field.displayName).literalValue;
      }
    }
    return data;
  }

  static AnnotationRd createFromFieldElement(ElementAnnotation annotation) {
    ClassElement annotationClass =
        AnnotationTypeUtils.getClassElement(annotation);
    int prefix = ImportManager.add(annotationClass);
    String type = annotationClass.displayName;
    Map<String, Object> data = getData(annotation);

    // private class will use Null to do the placeholder
    if (type.startsWith("_")) {
      return new AnnotationRd(
        type: "t<Null>()",
        data: data,
      );
    }

    // prefix will be added if the type is user-defined
    if (prefix != -1) {
      type = "p$prefix.$type";
    }

    return new AnnotationRd(
      type: "t<$type>()",
      data: data,
    );
  }
}
