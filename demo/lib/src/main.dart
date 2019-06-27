import 'package:demo/generated/entry.deflect.dart';
import 'package:demo/src/demo_base.dart';
import 'package:deflect/src/class.dart';
import 'package:deflect/src/lang/reflect/field.dart';

void main() {
  initDeflect();

  Awesome1 awesome1 = Awesome1();
  awesome1.field1 = "hi1";
  var awesomeClass = Class(awesome1);
  print(awesomeClass);
  List<Field> fields = awesomeClass.getFields();
  Field field1Field = awesomeClass.getField("field1");
  print(fields.first.get(awesome1));
  print(awesomeClass.getField("field1").get(awesome1));
  field1Field.set(awesome1, "hi2");
  print(awesome1.field1);
}
