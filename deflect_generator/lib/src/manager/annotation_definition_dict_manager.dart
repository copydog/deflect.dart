class AnnotationDefinitionDictManager {
  static Map<int, List<int>> _add = {};

  static registerAnnotation() {}
}

class MAnnotation {
  final int a;
  const MAnnotation(this.a);
}

class MAnnotation2 extends MAnnotation {
  const MAnnotation2(int a) : super(a);
}
