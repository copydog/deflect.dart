import 'package:deflect/src/class.dart';

abstract class Annotation {
  bool equals(Object obj);

  Class<Annotation> annotationType();
}
