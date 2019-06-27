import 'package:deflect/src/lang/reflect/annotated_element.dart';

import 'package:deflect/src/lang/annotation/annotation.dart';
import 'package:deflect/src/lang/reflect/annotated_element.dart';
import 'package:deflect/src/lang/reflect/constructor.dart';
import 'package:deflect/src/lang/reflect/field.dart';
import 'package:deflect/src/lang/reflect/method.dart';
import 'package:deflect/src/lang/reflection_data/reflection_data_manager.dart';

class Class<T> implements AnnotatedElement {
  static final int ANNOTATION = 0x00002000;
  static final int ENUM = 0x00004000;
  static final int SYNTHETIC = 0x00001000;

  int _classId;

  T t1;

  Class([T obj]) {
    _classId = ReflectionDataManager.getClassId(T);
  }

  Class.forId(this._classId);

  Class arrayType() {}

  Class componentType() {}

  Field getField(String name) {
    return ReflectionDataManager.getField(_classId, name);
  }

  List<Field> getFields() {
    return ReflectionDataManager.getFields(_classId);
  }

  //---------------------------------------------------------------------
  // Implementation of AnnotatedElement
  //---------------------------------------------------------------------

  @override
  T getAnnotation<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getAnnotation
  }

  @override
  List<Annotation> getAnnotations() {
    // TODO: implement getAnnotations
  }

  @override
  List<T> getAnnotationsByType<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getAnnotationsByType
  }

  @override
  T getDeclaredAnnotation<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getDeclaredAnnotation
  }

  @override
  List<Annotation> getDeclaredAnnotations() {
    // TODO: implement getDeclaredAnnotations
  }

  @override
  List<T> getDeclaredAnnotationsByType<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getDeclaredAnnotationsByType
  }

  @override
  bool isAnnotationPresent(Class<Annotation> annotationClass) {
    // TODO: implement isAnnotationPresent
  }
}

class ReflectionData<T> {
  List<Field> declaredFields;
  List<Field> publicFields;
  List<Method> declaredMethods;
  List<Method> publicMethods;
  List<Constructor<T>> declaredConstructors;
  List<Constructor<T>> publicConstructors;
  // Intermediate results for getFields and getMethods
  List<Field> declaredPublicFields;
  List<Method> declaredPublicMethods;
  List<Class> interfaces;

  // Value of classRedefinedCount when we created this ReflectionData instance
  final int redefinedCount;

  ReflectionData(this.redefinedCount);
}
