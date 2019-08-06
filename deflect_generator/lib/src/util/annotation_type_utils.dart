import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:analyzer/src/dart/element/handle.dart';

@sealed
abstract class AnnotationTypeUtils {
  static ClassElement getClassElement(
    ElementAnnotation annotation,
  ) {
    if (annotation.element is ClassElement) {
      return annotation.element;
    } else if ((annotation.element).enclosingElement is ClassElement) {
      return annotation.element.enclosingElement;
    } else if (annotation.element is PropertyAccessorElementHandle) {
      return (annotation.element as PropertyAccessorElementHandle)
          .returnType
          .element;
    } else {
      throw new Exception(
        "[DANGER]None of known annotation type: ${annotation.element}",
      );
    }
  }
}
