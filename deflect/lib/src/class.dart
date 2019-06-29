import 'package:deflect/src/reflect/annotated_element.dart';

import 'package:deflect/src/annotation/annotation.dart';
import 'package:deflect/src/reflect/constructor.dart';
import 'package:deflect/src/reflect/field.dart';
import 'package:deflect/src/reflect/method.dart';
import 'package:deflect/src/reflection_data/reflection.dart';

class Class<T> implements AnnotatedElement {
  static final int ANNOTATION = 0x00002000;
  static final int ENUM = 0x00004000;
  static final int SYNTHETIC = 0x00001000;

  ReflectionData rd = new ReflectionData(0);

  int _classId;

  Class([T obj]) {
    _classId = Reflection.getClassTypeId(T);
  }

  Class.forId(this._classId);

  Class arrayType() {}

  Class componentType() {}

  Field getField(String name) {
    if (rd.publicFields == null) {
      getFields();
    }

    return rd.publicFields.firstWhere(
      (e) => e.getName() == name,
      orElse: () => null,
    );
  }

  List<Field> getFields() {
    if (rd.publicFields != null) {
      return rd.publicFields;
    }

    return rd.publicFields = Reflection.getFields(_classId);
  }

  Field getDeclaredField(String name) {
    if (rd.declaredFields == null) {
      getDeclaredFields();
    }

    return rd.declaredFields.firstWhere(
      (e) => e.getName() == name,
      orElse: () => null,
    );
  }

  List<Field> getDeclaredFields() {
    if (rd.declaredFields != null) {
      return rd.declaredFields;
    }

    return rd.declaredFields = Reflection.getDeclaredFields(_classId);
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
  List<T> getDeclaredAnnotationsByType<T extends Annotation>(
      Class<T> annotationClass) {
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
