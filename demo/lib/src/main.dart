import 'package:demo/generated/entry.deflect.dart';
import 'package:demo/src/demo_base.dart';
import 'package:deflect/src/class.dart';
import 'package:deflect/src/lang/reflect/field.dart';

void main() {
  initDeflect();

  Awesome1 awesome1 = Awesome1();
  awesome1.field1 = "hi";
  print(awesome1.field1);
  Class awesomeClass = Class<Awesome1>();
  print(awesomeClass);
  List<Field> fields = awesomeClass.getFields();
  print(fields.first.get(awesome1));
  print(awesomeClass.getField("field1").get(awesome1));
}
