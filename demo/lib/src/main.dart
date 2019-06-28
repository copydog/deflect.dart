import 'package:demo/generated/entry.deflect.dart';
import 'package:demo/src/demo_base.dart';
import 'package:deflect/deflect.dart';

void main() {
  initDeflect();

  Awesome1 awesome1 = Awesome1();
  awesome1.field1 = "hi1";
  Class<Awesome1> awesomeClass = deflect(awesome1);
  print(awesomeClass);
  List<Field> fields = awesomeClass.getFields();
  Field field1Field = awesomeClass.getField("field1");
  print(fields.first.get(awesome1));
  print(awesomeClass.getField("field1").get(awesome1));
  field1Field.set(awesome1, "hi2");
  print(awesome1.field1);
}
